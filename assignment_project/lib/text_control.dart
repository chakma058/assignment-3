import 'package:assignment_project/text_output.dart';
import 'package:flutter/material.dart';

class TextControl extends StatefulWidget {
  const TextControl({super.key});

  @override
  State<TextControl> createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  String _mainText = 'Come on';
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        onPressed: () {
          setState(() {
            _mainText = 'It changed';
          });
        },
        child: Text('Change text'),
      ),
      TextOutput(_mainText),
    ]);
  }
}
