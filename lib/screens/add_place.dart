import 'package:flutter/material.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({super.key});
  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleController = TextEditingController();
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
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                        child: const Center(
                          child: Text('No Image'),
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Expanded(
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.camera),
                          label: const Text('Take Picture'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
          ),
        ],
      ),
    );
  }
}
