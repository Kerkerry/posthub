import 'package:flutter/material.dart';

class AuthenticationTextInput extends StatefulWidget {
  const AuthenticationTextInput(
      {super.key,
      required TextEditingController textEditingController,
      required String textLabel})
      : _textEditingController = textEditingController,
        _textLabel = textLabel;
  final TextEditingController _textEditingController;
  final String _textLabel;

  @override
  State<AuthenticationTextInput> createState() =>
      _AuthenticationTextInputState();
}

class _AuthenticationTextInputState extends State<AuthenticationTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._textEditingController,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), label: Text(widget._textLabel)),
    );
  }
}
