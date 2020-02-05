import 'package:flutter/material.dart';

abstract class IAlertService {
  void showError(String message, { VoidCallback onPressed });
}

class AlertService extends IAlertService {
  final BuildContext _context;

  AlertService(this._context);

  @override
  void showError(String message, {VoidCallback onPressed}) {
    showDialog(
        context: _context,
        builder: (__) {
          return AlertDialog(
//            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(_context).pop();
                  if (onPressed != null) {
                    onPressed();
                  }
                },
              )
            ],
          );
        }
    );
  }


}