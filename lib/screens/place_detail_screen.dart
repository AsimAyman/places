import 'package:flutter/material.dart';

import '../models/place.dart';

class PlacesDetailScreen extends StatelessWidget {
  const PlacesDetailScreen({required this.place, super.key});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Center(
        child: Image.file(place.image,fit: BoxFit.cover ,),
      ),
    );
  }
}
