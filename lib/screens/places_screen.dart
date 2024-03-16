import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled15/providers/places_provider.dart';
import 'package:untitled15/screens/add_place_screen.dart';
import 'package:untitled15/widgets/places_list_widget.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var places = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddPlaceScreen(),
                  ),
                );
              },
              icon:const Icon(Icons.add))
        ],
      ),
      body: PlacesListWidget(places: places),
    );
  }
}
