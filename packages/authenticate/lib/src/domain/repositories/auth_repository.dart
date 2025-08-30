import 'package:authenticate/src/domain/entities/auth_response/Auth_response.dart';
import 'package:authenticate/src/domain/entities/login_request/login_request.dart';


abstract class AuthRepository{
  Future<AuthResponse> login(LoginRequest request);
}
