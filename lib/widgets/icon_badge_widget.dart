import 'package:flutter/material.dart';

class IconBadgeWidget extends StatelessWidget {
  final int badge;
  final IconData icon;
  final VoidCallback onPressed;

  const IconBadgeWidget({
    @required this.badge,
    @required this.icon,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    if (badge > 0) {
      return Stack(
        children: <Widget>[
          IconButton(
            icon: Icon(icon),
            onPressed: onPressed,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              constraints: BoxConstraints(
                minWidth: 12,
                minHeight: 12,
              ),
              child: Text(
                '$badge',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      );
    }
  }


}