import 'package:flutter/material.dart';
import 'package:untitled15/screens/place_detail_screen.dart';

import '../models/place.dart';

class PlacesListWidget extends StatelessWidget {
  const PlacesListWidget({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text('No places added yet'),
      );
    } else {
      return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundImage: FileImage(places[index].image),
            maxRadius: 26,
          ),
          title: Text(places[index].title),
          titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => PlacesDetailScreen(place: places[index]),
            ));
          },
        ),
      );
    }
  }
}
