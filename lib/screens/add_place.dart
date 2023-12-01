import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_features/models/place.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends ConsumerState<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: const InputDecoration(labelText: "Title"),
                  onSaved: (value) {
                    print(value.toString());
                    _enteredTitle = value!;
                  }),
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  print(_enteredTitle);
                  Navigator.of(context).pop(Place(title: _enteredTitle));
                },
                icon: const Icon(Icons.add),
                label: const Text('Add place'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
