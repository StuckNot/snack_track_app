import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String name;
  final int age;
  final String gender;
  final double? heightCm;
  final double? weightKg;
  final List<String> healthConditions;
  final String language;
  final String nationality;
  final String dietPreference;

  const UserProfile({
    required this.name,
    required this.age,
    required this.gender,
    required this.healthConditions,
    required this.language,
    required this.nationality,
    required this.dietPreference,
    required this.heightCm,
    required this.weightKg,
  });

  @override
  List<Object?> get props => [
    name,
    age,
    gender,
    heightCm,
    weightKg,
    healthConditions,
    language,
    nationality,
    dietPreference,
  ];
}
