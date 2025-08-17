import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/domain/entities/user_profile.dart';
import 'package:profile/src/domain/use_cases/fetch_user_profile.dart';

class MockFetchUserProfile extends Mock implements FetchUserProfile {}

/// Usage: I land on profile page with correct data
Future<void> iLandOnProfilePageWithCorrectData(WidgetTester tester) async {
  final mockFetchUserProfile = MockFetchUserProfile();
  GetIt.I.registerLazySingleton<FetchUserProfile>(() => mockFetchUserProfile);
  when(() => mockFetchUserProfile()).thenAnswer((_){
    return Future.value(const UserProfile(
      name: 'Sunpreet',
      age: 30,
      gender: 'M',
      healthConditions: ['sugar'],
      language: 'English',
      nationality: 'India',
      dietPreference: 'Veg',
      heightCm: 172,
      weightKg: 65,
    ));
  });
  await tester.pumpWidget(const MaterialApp(
    title: 'SnackTrack',
    localizationsDelegates:  [
      ...ProfileLocalization.localizationsDelegates,
    ],
    supportedLocales:  [
      ...ProfileLocalization.supportedLocales,
    ],
    debugShowCheckedModeBanner: false,
    home: ProfileScreen(),
  ));

}
