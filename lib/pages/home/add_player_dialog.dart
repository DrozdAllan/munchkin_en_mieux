import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/player/player.dart';

class AddPlayerDialog extends StatefulWidget {
  const AddPlayerDialog({Key? key, required this.box}) : super(key: key);

  final Box box;

  @override
  State<AddPlayerDialog> createState() => _AddPlayerDialogState();
}

class _AddPlayerDialogState extends State<AddPlayerDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  Color _color = const Color(0xff443a49);

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  void changeColor(Color color) {
    setState(() => _color = color);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 550.0,
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 380.0,
                child: BlockPicker(pickerColor: _color, onColorChanged: changeColor),
              ),
              ElevatedButton(
                onPressed: () {
                  // test form fields
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                    widget.box.add(
                      Player(_name.text, 1, 0, _color.value),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Validate'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
