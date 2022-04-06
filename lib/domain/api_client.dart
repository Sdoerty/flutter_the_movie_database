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
      if(response.statusCode == 401){
        final dynamic status = json["status_code"];
        final code = status is int ? status : 0;
        if(code == 30){
          throw ApiClientException(ApiClientExceptionType.Auth);
        }else{
          throw ApiClientException(ApiClientExceptionType.Other);
        }
      }

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
      if(response.statusCode == 401){
        throw ApiClientException(ApiClientExceptionType.Auth);
      }

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
}
