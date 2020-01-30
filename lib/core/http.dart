import 'dart:convert';

import 'package:gogreen/services/services.dart';
import 'package:http/http.dart';

class DenovoHttpClient extends BaseClient {
  final ITokenService _tokenService;
  final Client _client = Client();
  final String _path = "http://test.dvmms.com/denovo";

  DenovoHttpClient(this._tokenService);

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return _tokenService.getDenovoToken().then((token) {
      if (token.isNotEmpty) {
        request.headers["Authorization"] = "Bearer $token";
      }

      return _client.send(request);
    });
  }

  @override
  Future<Response> post(url,
      {Map<String, String> headers, body, Encoding encoding}) {

    return super.post("$_path$url", headers: headers, body: body, encoding: encoding);
  }


}
