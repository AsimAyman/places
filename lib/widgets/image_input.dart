import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  ImageInput({required this.onSelectedImage,super.key});
  void Function(File selectedImage) onSelectedImage;
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  File? _selectedImage;
  var content;

  _takeImage() async {
    ImagePicker imagePicker = ImagePicker();
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage == null) {
      return;
    }
    _selectedImage = File(pickedImage.path);
    widget.onSelectedImage(_selectedImage!);
    setState(() {
      content = GestureDetector(
        onTap: _takeImage,
         child:
      Image.file(
      _selectedImage!,
      fit: BoxFit.cover,
      width: double.infinity,
        height: double.infinity,
      ),);
    });
  }

  @override
  void initState() {
    content = TextButton.icon(
      onPressed: _takeImage,
      icon: const Icon(Icons.camera),
      label: const Text('Take a Photo'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme
                .of(context)
                .colorScheme
                .primary
                .withOpacity(.8),
          ),
        ),
        alignment: Alignment.center,
        child: content);
  }
}
