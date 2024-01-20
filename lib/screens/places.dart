import 'package:favourite_places_app/widgets/place_list.dart';
import 'package:flutter/material.dart';

class Places extends StatelessWidget {
  const Places({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Great Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed('/add-place');
            },
          ),
        ],
      ),
      body: const PlaceList(
        places: [],
      ),
    );
  }
}
