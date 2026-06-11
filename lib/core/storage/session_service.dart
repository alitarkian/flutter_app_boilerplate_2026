import 'package:injectable/injectable.dart';

@lazySingleton
class SessionService {
  String? _token;

  Future<void> saveToken(String token) async {
    _token = token;
  }

  Future<bool> isLoggedIn() async {
    return _token != null && _token!.isNotEmpty;
  }

  Future<void> clear() async {
    _token = null;
  }
}