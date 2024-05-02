import 'package:flutter/material.dart';

class BasedTextFormField extends StatelessWidget {
  const BasedTextFormField({super.key, this.hindText, this.onChange});

  final String? hindText;
  final void Function(String)? onChange;

  _setOutlineInputBorder(BuildContext context, bool isFocused) {
    return OutlineInputBorder(
      borderSide:
          BorderSide(color: isFocused ? Theme.of(context).primaryColor : Color.fromRGBO(133, 140, 145, 1), width: 1),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        enabledBorder: _setOutlineInputBorder(context, false),
        focusedBorder: _setOutlineInputBorder(context, true),
        hintText: hindText,
        hintStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}
