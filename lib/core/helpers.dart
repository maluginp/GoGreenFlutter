import 'package:uuid/uuid.dart';

class GuidHelper {
  static String generate() {
    return Uuid().v4();
  }
}

T sum<T extends num>(T lhs, T rhs) => lhs + rhs;