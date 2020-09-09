import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String) onSubmitted;
  final TextInputType keyboardType;
  AdaptativeTextField({
    this.controller,
    this.label,
    this.onSubmitted,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            placeholder: label,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            textCapitalization: TextCapitalization.words,
          )
        : TextField(
            controller: controller,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(labelText: label),
            keyboardType: keyboardType,
            autofocus: true,
            onSubmitted: onSubmitted,
            textCapitalization: TextCapitalization.words,
          );
  }
}
