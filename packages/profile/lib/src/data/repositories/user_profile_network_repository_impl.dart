import 'package:profile/src/domain/entities/user_profile.dart';
import 'package:profile/src/domain/repositories/user_profile_repository.dart';


class UserProfileNetworkRepositoryImpl implements UserProfileRepository {
  @override
  Future<UserProfile?> fetchUserProfile() {
    // TODO: implement fetchUserProfile
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserProfile(UserProfile profile) {
    // TODO: implement updateUserProfile
    throw UnimplementedError();
  }
}
