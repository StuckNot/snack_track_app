part of 'login_bloc.dart';

abstract class LoginStates{}

class LoginInitial extends LoginStates{}

class LoginSuccess extends LoginStates{
  final LoginResponse response=LoginResponse(statusCode: '200', message: 'Login successful');

}

class LoginFailure extends LoginStates{
  final LoginResponse response=LoginResponse(statusCode: '400', message: 'Bad request');

}