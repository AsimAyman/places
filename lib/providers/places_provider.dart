import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled15/models/place.dart';

class UserPlacesStateNotifier extends StateNotifier<List<Place>> {
  UserPlacesStateNotifier() : super(const []);

  addPlace(String title,File image) {
    Place newPlace = Place(title: title,image: image);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesStateNotifier, List<Place>>(
  (ref) => UserPlacesStateNotifier(),
);
