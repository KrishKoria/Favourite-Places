import 'package:favourite_places_app/models/place.dart';
import 'package:flutter/material.dart';

class PlaceDetails extends StatelessWidget {
  final Place place;

  const PlaceDetails({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Column(
        children: [
          // Expanded(
          //   child: Hero(
          //     tag: 'image_${place.name}',
          //     child: Image.network(place.url),
          //   ),
          // ),
          // const SizedBox(height: 20),
          Text(
            place.title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
