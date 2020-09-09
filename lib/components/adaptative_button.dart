import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: onPressed,
            color: theme.primaryColor,
          )
        : RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: theme.textTheme.button.color,
            child: Text(label),
            onPressed: onPressed,
          );
  }
}
