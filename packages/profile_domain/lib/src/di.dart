import 'package:get_it/get_it.dart';
import 'package:profile_domain/profile_domain.dart';

void registerProfileDomainDependencies(GetIt sl) {
  sl
    ..registerLazySingleton(() => FetchUserProfile(sl<UserProfileRepository>()))
    ..registerLazySingleton(
      () => UpdateUserProfile(sl<UserProfileRepository>()),
    );
}
