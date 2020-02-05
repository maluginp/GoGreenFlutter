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
}

T sum<T extends num>(T lhs, T rhs) => lhs + rhs;