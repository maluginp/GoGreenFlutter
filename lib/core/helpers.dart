import 'package:uuid/uuid.dart';

class GuidHelper {
  static String generate() {
    return Uuid().v4();
  }
}