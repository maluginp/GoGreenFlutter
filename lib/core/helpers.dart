import 'dart:math';

import 'package:http/http.dart';
import 'package:uuid/uuid.dart';

class GuidHelper {
  static String generate() {
    return Uuid().v4();
  }
}

class HttpHelper {
  static bool isUnauthorised(Response response) {
    return response.statusCode == 401;
  }

  static double parseWebAmount(int amount) {
    return (amount / 100.0);
  }
}

T sum<T extends num>(T lhs, T rhs) => lhs + rhs;