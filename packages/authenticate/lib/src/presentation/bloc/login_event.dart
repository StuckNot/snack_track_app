part of 'login_bloc.dart';
abstract class LoginEvents {}

class OnButtonPressed extends LoginEvents{
  final LoginRequest request;
  OnButtonPressed({required this.request});
}