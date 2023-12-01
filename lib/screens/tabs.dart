import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_features/providers/places_provider.dart';
import 'package:native_features/screens/add_place.dart';
import 'package:native_features/screens/place_screen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  void _addItem() async {
    final newPlace = await Navigator.of(context).push<AddPlaceScreen>(
      MaterialPageRoute(
        builder: (ctx) => const AddPlaceScreen(),
      ),
    );

    if (newPlace == null) {
      return;
    }

    // ref.watch(placesProvider).add(newPlace);
  }

  @override
  Widget build(BuildContext context) {
    final places = ref.watch(placesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yours Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addItem,
            // () {
            //   print("object");
            // Navigator.of(context).push<AddPlaceScreen>(MaterialPageRoute(
            //     builder: (ctx) => const AddPlaceScreen()));
            // },
          )
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: places.length,
          itemBuilder: (ctx, index) => ListTile(
                title: Text(places[index].title),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => PlaceScreen(places[index]),
                    ),
                  );
                },
              )),
    );
  }
}
