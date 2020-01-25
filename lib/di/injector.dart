import 'package:gogreen/services/log_service.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  ILogService get logService {
    return LogService();
  }
}