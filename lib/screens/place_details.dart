import 'package:favourite_places_app/models/place.dart';
import 'package:flutter/material.dart';

class PlaceDetails extends StatelessWidget {
  final Place place;

  const PlaceDetails({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Stack(
        children: [
          Expanded(
            child: Image.file(place.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity),
          ),
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
        ],
      ),
    );
  }
}
