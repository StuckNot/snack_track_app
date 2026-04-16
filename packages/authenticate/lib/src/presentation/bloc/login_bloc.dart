import 'package:authenticate/src/domain/entities/auth_response/Auth_response.dart';
import 'package:authenticate/src/domain/entities/login_request/login_request.dart';
import'package:flutter_bloc/flutter_bloc.dart';
part 'login_event.dart';
part 'login_state.dart';
class LoginBloc extends Bloc<LoginEvents,LoginStates>{
  LoginBloc(): super(LoginInitial()){
    on<OnButtonPressed>((event,emit) async {
      final request = event.request;
      if (request.email.isEmpty || request.password.isEmpty){
        return emit(LoginFailure());
      }
      await Future.delayed(const Duration(seconds: 1),(){
        return emit(LoginSuccess());
      });
    });
  }
}