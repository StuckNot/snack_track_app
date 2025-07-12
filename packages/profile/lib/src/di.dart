import 'package:get_it/get_it.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/domain/di.dart';
import 'package:profile/src/domain/repositories/user_profile_repository.dart';

void registerProfileDependencies(GetIt sl) {
  sl.registerLazySingleton<UserProfileRepository>(
        UserProfileLocalRepositoryImpl.new,
  );
  registerProfileDomainDependencies(sl);

}
