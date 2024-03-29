import 'package:favourite_places_app/models/place.dart';
import 'package:favourite_places_app/screens/map.dart';
import 'package:flutter/material.dart';

class PlaceDetails extends StatelessWidget {
  final Place place;

  const PlaceDetails({super.key, required this.place});

  String get locationImage {
    final lat = place.location.latitude;
    final lng = place.location.longitude;

    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=AIzaSyC1tZoNbomHoYJWaLR_YgwZ1-K_1GoxCfY';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Stack(
        children: [
          Image.file(place.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity),
          const SizedBox(height: 20),
          Center(
            child: Text(
              place.title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          const SizedBox(height: 10),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx) => MapScreen(
                                location: place.location,
                                isSelecting: false,
                              )),
                    );
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(locationImage),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    place.location.address,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
