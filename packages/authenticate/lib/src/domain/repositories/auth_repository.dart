import 'package:authenticate/src/domain/entities/login_request/login_request.dart';
import 'package:authenticate/src/domain/entities/login_response/login_response.dart';

abstract class AuthRepository{
  Future<LoginResponse> login(LoginRequest request);
}
