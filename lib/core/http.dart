import 'dart:async';
import 'dart:convert';

import 'package:gogreen/di/injector.dart';
import 'package:gogreen/services/services.dart';
import 'package:http/http.dart';

import 'helpers.dart';

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
    String path = "$_path/$url";

    print("--> POST $path");
    headers?.forEach((key, value) {
      print("$key:$value");
    });
    _printWrapped(body.toString());

    return super
        .post(path, headers: headers, body: body, encoding: encoding)
        .then(handleResponse)
        .then(
      (response) {
        print("<-- POST $path");
        _printWrapped(response.body);
        return Future.value(response);
      },
    );
  }

  Future<Response> getWithArgs(url, {Map<String, Object> query, Map<String, String> headers}) {
    String path = url;

    int numberOfQueries = query?.length ?? 0;
    if (numberOfQueries > 0) {
      path += "?";

      path += query.entries
        .map((e) => "${e.key}=${e.value}")
        .join("&");
    }

    return get(path, headers: headers);
  }

  @override
  Future<Response> get(url, {Map<String, String> headers}) {
    String path = "$_path/$url";

    print("--> GET $path");
    headers?.forEach((key, value) {
      print("$key:$value");
    });

    return super.get(path, headers: headers).then(handleResponse).then(
      (response) {
        print("<-- GET ${response.statusCode} $path");
        _printWrapped(response.body);
        return Future.value(response);
      },
    );
  }

  FutureOr<Response> handleResponse(Response response) async {
    if (HttpHelper.isUnauthorised(response)) {
      await Injector().authService.logout();
      await Injector().navigationService.logout();
    }

    return response;
  }

  void _printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}
