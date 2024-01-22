import 'dart:convert';

import 'package:favourite_places_app/models/place.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectedLocation});
  final void Function(PlaceLocation) onSelectedLocation;
  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  var _isGettingLocation = false;
  PlaceLocation? _placeLocation;
  final dio = Dio();

  String get locationImage {
    if (_placeLocation == null) return '';
    final lat = _placeLocation!.latitude;
    final lng = _placeLocation!.longitude;

    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=AIzaSyBFS7waRwKuLnKIo3j7yCwpnPH6wDWfHKw';
  }

  Future<void> _getCurrentUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    setState(() {
      _isGettingLocation = true;
    });
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return;
    }
    final location = await Geolocator.getCurrentPosition();
    final response = await dio.get(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${location.latitude},${location.longitude}&key=AIzaSyBFS7waRwKuLnKIo3j7yCwpnPH6wDWfHKw');
    final responseData =
        json.decode(response.toString()) as Map<String, dynamic>;

    final address = responseData['results'][0]['formatted_address'];

    setState(() {
      _placeLocation = PlaceLocation(
        latitude: location.latitude,
        longitude: location.longitude,
        address: address,
      );
      _isGettingLocation = false;
    });
    widget.onSelectedLocation(_placeLocation!);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent;
    if (_isGettingLocation == false) {
      previewContent = Text(
        "No Location Chosen",
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      );
    } else {
      previewContent = const CircularProgressIndicator();
    }

    if (_placeLocation != null) {
      previewContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
              width: 1,
            ),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: const Icon(Icons.location_on),
              label: const Text("Get Location Automatically"),
            ),
            Expanded(
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.map),
                label: const Text(
                  "Select Manually",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
