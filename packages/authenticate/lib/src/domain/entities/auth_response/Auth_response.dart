import 'package:freezed_annotation/freezed_annotation.dart';

part 'Auth_response.freezed.dart';
part 'Auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse{

  factory AuthResponse({required String statusCode, required String message})= _AuthResponse;
  factory AuthResponse.fromJson(Map<String,dynamic> json)=>_$AuthResponseFromJson(json);
}