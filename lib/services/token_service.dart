import 'package:shared_preferences/shared_preferences.dart';

abstract class ITokenService {
  Future<String> getDenovoToken();
  Future setDenovoToken(String token);
  Future<String> getInventoryToken();
}

class TokenService extends ITokenService {
  static const String DENOVO_TOKEN = "denovo_token";

  @override
  Future<String> getDenovoToken() async {
    var prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(DENOVO_TOKEN)) {
      return prefs.getString(DENOVO_TOKEN);
    }

    return "";
  }


  @override
  Future setDenovoToken(String token) async {
    var prefs = await SharedPreferences.getInstance();

    if (token.isEmpty) {
      await prefs.remove(DENOVO_TOKEN);
    } else {
      await prefs.setString(DENOVO_TOKEN, token);
    }

    return;
  }

  @override
  Future<String> getInventoryToken() {
    return Future.value("");
  }


}