import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});
  final void Function(File pickedImage) onPickImage;
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  void _takePicture() async {
    bool? isCamera = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child:
                  Text("Camera", style: Theme.of(context).textTheme.titleLarge),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                "Gallery",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );

    final imagePicker = ImagePicker();
    if (isCamera == null) {
      return;
    }
    final pickedImage = await imagePicker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 600,
      maxHeight: 600,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _storedImage = File(pickedImage.path);
    });
    widget.onPickImage(_storedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (_storedImage == null) {
      content = TextButton.icon(
        icon: const Icon(Icons.camera),
        label: const Text("Take Picture"),
        onPressed: _takePicture,
      );
    } else {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _storedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
          width: 1,
        ),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
