import 'dart:io';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled15/providers/places_provider.dart';
import 'package:untitled15/widgets/image_input.dart';

import '../widgets/location_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  Location location = new Location();
   onSelectedLocation(){
     return  location.getLocation();
  }
   void onSelectedImage(File pickedImage){
     setState(() {
       _selectedImage = pickedImage;
     });
   }
  _savePlace(){
    var enteredTitle = _titleController.text;
    if(enteredTitle.isNotEmpty && _selectedImage != null){
      ref.read(userPlacesProvider.notifier).addPlace(enteredTitle,_selectedImage!);
      Navigator.pop(context);
    }
  }
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            ImageInput(onSelectedImage: onSelectedImage,),
            const SizedBox(
              height: 16,
            ),
            LocationInput(),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add place'),
            ),

          ],
        ),
      ),
    );
  }
}
