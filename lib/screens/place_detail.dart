import 'package:flutter/material.dart';
import 'package:native_features/models/place.dart';
import 'package:native_features/screens/map.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  String get locationImage {
    var apiKey = 'AIzaSyBi_386v-iP6KCjJJtH_dzMVuRyfmyMuyo';
    var lat = place.location.latitude;
    var lng = place.location.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7$lat,$lng&key=$apiKey';
  }

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => MapScreen(
                            location: place.location,
                            isSelecting: false,
                          ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(locationImage),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                        ],
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text(place.location.address,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            )),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
