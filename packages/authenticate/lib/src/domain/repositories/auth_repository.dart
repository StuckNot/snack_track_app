import 'package:authenticate/src/domain/entities/login_request.dart';
import 'package:authenticate/src/domain/entities/login_response.dart';

abstract class AuthRepository{
  Future<LoginResponse> login(LoginRequest request);
}
