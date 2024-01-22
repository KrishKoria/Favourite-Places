import 'package:flutter/material.dart';
// import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});
  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  var _isGettingLocation = false;
  // the below code is for getting the location of the user, however it is not working and causes the stupid app to crash
  // Future<void> _getCurrentUserLocation() async {
  //   print("Testing above setState1");
  //   setState(() {
  //     _isGettingLocation = true;
  //   });
  //   print("Above the if else block");
  //   final permission = await requestPermission();
  //   if (permission == PermissionStatus.authorizedAlways ||
  //       permission == PermissionStatus.authorizedWhenInUse) {
  //     try {
  //       print("Inside the if else block");
  //       final location = await getLocation(
  //         settings: LocationSettings(
  //           accuracy: LocationAccuracy.high,
  //           askForPermission: true,
  //           askForGPS: true,
  //           askForGooglePlayServices: true,
  //         ),
  //       );
  //       print("${location.latitude} ${location.longitude}");
  //     } catch (e) {
  //       print("Error getting location: $e");
  //     }
  //   } else {
  //     print("Location permission not granted");
  //   }
  // }

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
            // TextButton.icon(
            //   onPressed: _getCurrentUserLocation,
            //   icon: const Icon(Icons.location_on),
            //   label: const Text("Get Location Automatically"),
            // ),
            Expanded(
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.map, size: 24),
                label: const Text(
                  "Select Location on Map",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
