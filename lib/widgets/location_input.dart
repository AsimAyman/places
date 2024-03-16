import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  bool _locationIsLoading= false;
  void selectLocation() async {
    Location location =  Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    log(locationData.altitude.toString());
    log(locationData.longitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(.8),
            ),
          ),
          alignment: Alignment.center,
          child: Text('No Location is selected'),
        ),
        Row(
          children: [
            TextButton.icon(
              onPressed: selectLocation,
              icon: Icon(Icons.location_on),
              label: Text('Get Current Location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map_outlined),
              label: Text('Get Location from the map'),
            ),
          ],
        )
      ],
    );
  }
}
