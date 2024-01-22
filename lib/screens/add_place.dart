import 'dart:io';

import 'package:favourite_places_app/providers/user_places.dart';
import 'package:favourite_places_app/widgets/image_input.dart';
import 'package:favourite_places_app/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({super.key});
  @override
  ConsumerState<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlace> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    ref
        .read(userPlacesProvider.notifier)
        .addPlace(_titleController.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new place'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    controller: _titleController,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ImageInput(
                    onPickImage: (image) {
                      _pickedImage = image;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const LocationInput(),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 160,
            child: ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text(
                'Add Place',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
