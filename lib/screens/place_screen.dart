import 'package:flutter/material.dart';
import 'package:native_features/models/place.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen(this.place, {super.key});
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Center(child: Text(place.title)),
    );
  }
}
