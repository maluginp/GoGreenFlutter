import 'package:flutter/material.dart';
import 'package:gogreen/core/dimens.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  BottomButton({
    @required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.of(context).bottomButtonHeight,
      width: double.infinity,
      child: FlatButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed();
          }
        },
        color: Theme.of(context).accentColor,
        child: Text(text.toUpperCase()),
      ),
    );
  }
}
