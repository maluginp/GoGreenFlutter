import 'dart:convert';

import 'package:gogreen/core/http.dart';
import 'package:http/http.dart';

import 'services.dart';

abstract class IAuthService {
  Future<bool> auth(String username, String password);

  Future<bool> isAuthorised();
}

class AuthService extends IAuthService {
  final DenovoHttpClient _denovoHttpClient;
  final ITokenService _tokenService;

  AuthService(this._denovoHttpClient, this._tokenService);

  @override
  Future<bool> auth(String username, String password) async {
    Response response = await _denovoHttpClient.post(
      '/Token',
      body: {
        'grant_type': 'password',
        'username': username,
        'password': password
      },
    );

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var token = body['access_token'];

      await _tokenService.setDenovoToken(token);

      return true;
    }

    return false;
  }

  @override
  Future<bool> isAuthorised() async {
    String token = await _tokenService.getDenovoToken();

    return token.isNotEmpty;
  }
}
