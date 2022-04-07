import 'dart:convert';
import 'dart:io';

//https://developers.themoviedb.org/3/authentication/how-do-i-generate-a-session-id

enum ApiClientExceptionType{
  NetworkError, Auth, Other
}

class ApiClientException implements Exception{
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  static const _apiKey = '79386dc0215c399a921e63686006f658';

  Future<String> auth({required String username, required String password}) async{
    final token = await _makeToken();
    final validatedToken = await _validateUser(username: username, password: password, requestToken: token);
    final sessionId = await _makeSession(requestToken: validatedToken);
    return sessionId;

  }

  Future<String> _makeToken() async {
    try{
      final url = await Uri.parse(
          'https://api.themoviedb.org/3/authentication/token/new?api_key=$_apiKey');
      final request = await _client.getUrl(url);
      final response = await request.close();
      final json = await response
          .transform(utf8.decoder)
          .toList()
          .then((value) => value.join())
          .then((v) => jsonDecode(v) as Map<String, dynamic>);
      _validateResponse(response, json);
      final token = json['request_token'] as String;
      return token;
    }on SocketException{
      throw ApiClientException(ApiClientExceptionType.Auth);
    }on ApiClientException{
      rethrow;
    }catch(_){
      throw ApiClientException(ApiClientExceptionType.Other);
    }
  }

  Future<String> _validateUser(
      {required String username,
        required String password,
        required String requestToken}) async {
    try{
      final url = await Uri.parse(
          'https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=$_apiKey');
      final parameters = <String, dynamic>{
        'username': username,
        'password': password,
        'request_token': requestToken
      };
      final request = await _client.postUrl(url);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(parameters));
      final response = await request.close();
      final json = await response
          .transform(utf8.decoder)
          .toList()
          .then((value) => value.join())
          .then((v) => jsonDecode(v) as Map<String, dynamic>);
      _validateResponse(response, json);
      final token = json['request_token'] as String;
      return token;
    }on SocketException{
      throw ApiClientException(ApiClientExceptionType.NetworkError);
    }on ApiClientException{
      rethrow;
    }catch(_){
      throw ApiClientException(ApiClientExceptionType.Other);
    }
  }

  Future<String> _makeSession({required String requestToken}) async {
    try{
      final url = await Uri.parse(
          'https://api.themoviedb.org/3/authentication/session/new?api_key=$_apiKey');
      final parameters = <String, dynamic>{'request_token': requestToken};
      final request = await _client.postUrl(url);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(parameters));
      final response = await request.close();
      final json = await response
          .transform(utf8.decoder)
          .toList()
          .then((value) => value.join())
          .then((v) => jsonDecode(v) as Map<String, dynamic>);
      _validateResponse(response, json);
      final sessionId = json['session_id'] as String;
      return sessionId;
    }on SocketException{
      throw ApiClientException(ApiClientExceptionType.Auth);
    }on ApiClientException{
      rethrow;
    }catch(_){
      throw ApiClientException(ApiClientExceptionType.Other);
    }
  }

  void _validateResponse(HttpClientResponse response, dynamic json) {
    if (response.statusCode == 401) {
      final dynamic status = json["status_code"];
      final code = status is int ? status : 0;
      if (code == 30) {
        throw ApiClientException(ApiClientExceptionType.Auth);
      } else {
        throw ApiClientException(ApiClientExceptionType.Other);
      }
    }
  }
}

// REFACTOR

/*enum ApiClientExceptionType { NetworkError, Auth, Other }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  static const _apiKey = '79386dc0215c399a921e63686006f658';

  Future<String> auth(
      {required String username, required String password}) async {
    final token = await _makeToken();
    final validatedToken = await _validateUser(
        username: username, password: password, requestToken: token);
    final sessionId = await _makeSession(requestToken: validatedToken);
    return sessionId;
  }
 // Универсальный get
  Future<T> _get<T>(T Function(dynamic json) parser, Uri url) async {
    try {
      final url = await Uri.parse(
          'https://api.themoviedb.org/3/authentication/token/new?api_key=$_apiKey');
      final request = await _client.getUrl(url);
      final response = await request.close();
      final dynamic json = await response
          .transform(utf8.decoder)
          .toList()
          .then((value) => value.join())
          .then((v) => jsonDecode(v));
      _validateResponse(response, json);
      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.Auth);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(ApiClientExceptionType.Other);
    }
  }

  // Универсальный post
  Future<T> _post<T>(Map<String, dynamic> bodyParameters,
      T Function(dynamic json) parser, url) async {
    try {
      final request = await _client.postUrl(url);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(bodyParameters));
      final response = await request.close();
      final dynamic json = await response
          .transform(utf8.decoder)
          .toList()
          .then((value) => value.join())
          .then((v) => jsonDecode(v));
      _validateResponse(response, json);

      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.NetworkError);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(ApiClientExceptionType.Other);
    }
  }

  Future<String> _makeToken() async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['request_token'] as String;
      return token;
    };
    final url = await Uri.parse(
        'https://api.themoviedb.org/3/authentication/token/new?api_key=$_apiKey');
    final result = _get(parser, url);
    return result;
  }

  Future<String> _validateUser(
      {required String username,
      required String password,
      required String requestToken}) async {
    final parameters = <String, dynamic>{
      'username': username,
      'password': password,
      'request_token': requestToken
    };
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['request_token'] as String;
      return token;
    };
    final url = await Uri.parse(
        'https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=$_apiKey');
    final result = _post(parameters, parser, url);
    return result;
  }

  Future<String> _makeSession({required String requestToken}) async {
    final parameters = <String, dynamic>{'request_token': requestToken};
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final sessionId = jsonMap['session_id'] as String;
      return sessionId;
    };
    final url = await Uri.parse(
        'https://api.themoviedb.org/3/authentication/session/new?api_key=$_apiKey');
    final result = _post(parameters, parser, url);
    return result;
  }

  void _validateResponse(HttpClientResponse response, dynamic json) {
    if (response.statusCode == 401) {
      final dynamic status = json["status_code"];
      final code = status is int ? status : 0;
      if (code == 30) {
        throw ApiClientException(ApiClientExceptionType.Auth);
      } else {
        throw ApiClientException(ApiClientExceptionType.Other);
      }
    }
  }
}
*/
