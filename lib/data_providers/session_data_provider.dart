import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys{
  static const sessionId = 'session_id';
}

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getSessionId() => _secureStorage.read(key: _Keys.sessionId);
  Future<void> setSessionId(String? value) async {
    if (value != null){
      return await _secureStorage.write(key: _Keys.sessionId, value: value);
    }
    else return await _secureStorage.delete(key: _Keys.sessionId);
  }
}