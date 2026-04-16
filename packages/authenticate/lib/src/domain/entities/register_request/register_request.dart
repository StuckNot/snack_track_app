import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

@freezed
class RegisterRequest with _$RegisterRequest {
  factory RegisterRequest({
    required String name,
    required String email,
    required String password,
    required int age,
    required int height,
    required int weight,
    required String gender,
    required String dietary_preferences,
    required String health_goals,
    required String activity_level,
    List<String>? allergies
}) = _RegisterRequest;
  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}