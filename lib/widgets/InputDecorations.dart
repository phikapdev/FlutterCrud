import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoratios({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey, width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null
         ? Icon(Icons.alternate_email_sharp,color: Colors.blueGrey) : null );
  }
}
