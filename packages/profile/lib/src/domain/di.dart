import 'package:get_it/get_it.dart';
import 'package:profile/src/domain/repositories/user_profile_repository.dart';
import 'package:profile/src/domain/use_cases/fetch_user_profile.dart';
import 'package:profile/src/domain/use_cases/update_user_profile.dart';

void registerProfileDomainDependencies(GetIt sl) {
  sl
    ..registerLazySingleton(() => FetchUserProfile(sl<UserProfileRepository>()))
    ..registerLazySingleton(
      () => UpdateUserProfile(sl<UserProfileRepository>()),
    );
}
