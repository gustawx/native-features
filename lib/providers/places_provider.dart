import 'package:native_features/models/place.dart';
import 'package:riverpod/riverpod.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super([]);

  void addPlace(Place place) {
    state.add(place);
  }
}

final addPlaceProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
    (ref) => PlacesNotifier());

final placesProvider = Provider((ref) => ref.watch(addPlaceProvider));
