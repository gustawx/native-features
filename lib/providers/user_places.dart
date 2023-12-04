import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_features/models/place.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title) {
    final newPlace = Place(title: title);
    state = [...state, newPlace];
  }
}

final UserPlacesProvider = StateNotifierProvider((ref) => UserPlacesNotifier());
