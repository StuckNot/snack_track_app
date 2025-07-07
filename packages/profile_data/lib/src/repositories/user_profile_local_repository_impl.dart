import 'dart:convert';

import 'package:profile_domain/profile_domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileLocalRepositoryImpl implements UserProfileRepository {
  static const _key = 'user_profile';

  @override
  Future<UserProfile?> fetchUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return null;

    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return UserProfile(
      name: json['name'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      heightCm: (json['heightCm'] as num?)?.toDouble(),
      weightKg: (json['weightKg'] as num?)?.toDouble(),
      healthConditions: List<String>.from(
        json['healthConditions'] as List<dynamic>? ?? [],
      ),
      language: json['language'] as String,
      nationality: json['nationality'] as String,
      dietPreference: json['dietPreference'] as String,
    );
  }

  @override
  Future<void> updateUserProfile(UserProfile profile) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode({
      'name': profile.name,
      'age': profile.age,
      'gender': profile.gender,
      'heightCm': profile.heightCm,
      'weightKg': profile.weightKg,
      'healthConditions': profile.healthConditions,
      'language': profile.language,
      'nationality': profile.nationality,
      'dietPreference': profile.dietPreference,
    });
    await prefs.setString(_key, jsonString);
  }
}
