import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_the_movie_database/data_providers/session_data_provider.dart';
import 'package:flutter_the_movie_database/domain/api_client.dart';
import 'package:flutter_the_movie_database/routes.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;

  bool get isAuthProgress => _isAuthProgress;

  // могу авторизоваться если авторизация не в прогрессе:
  bool get canStartAuth => !_isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (login.isEmpty || password.isEmpty) {
      _errorMessage = "Заполните логин и пароль";
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    try {
      sessionId = await _apiClient.auth(username: login, password: password);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.NetworkError:
          _errorMessage = "Сервер недоступен, попробуйте снова.";
          break;
        case ApiClientExceptionType.Auth:
          _errorMessage = "Неверный логин/пароль";
          break;
        case ApiClientExceptionType.Other:
          _errorMessage = "Произошла ошибка, попробуйте снова.";
          ;
          break;
      }
      _isAuthProgress = false;
      if (_errorMessage != null) {
        notifyListeners();
        return;
      }
      if (sessionId == null) {
        _errorMessage = 'Неизвестная ошибка';
        notifyListeners();
        return;
      }
      await _sessionDataProvider.setSessionId(sessionId);
      Navigator.of(context).pushReplacementNamed(RoutesKeys.main_page);
    }
  }
}
