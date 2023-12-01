import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_features/models/place.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier()
      : super(const [
          Place(title: "AAAAAAAAAA"),
          Place(title: "BBBBBBBBBB"),
        ]);

  void addPlace(Place place) {
    state = [...state, place];
  }
}

final addPlaceProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
  (ref) => PlacesNotifier(),
);

final placesProvider = Provider((ref) => ref.watch(addPlaceProvider));
