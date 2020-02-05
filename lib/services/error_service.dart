import 'package:flutter/material.dart';

abstract class IErrorFactory {
  String getMessage(BuildContext context, Exception ex);
}

abstract class IErrorService {
  String getMessage(Exception ex);
  /// Attach error messages to error service
  void attachFactory(IErrorFactory factory);
}


class ErrorService extends IErrorService {
  final BuildContext _context;

  ErrorService(this._context);

  @override
  String getMessage(Exception ex) {
    return ex.toString();
  }

  @override
  void attachFactory(IErrorFactory factory) {

  }


}