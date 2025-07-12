import 'package:profile/src/domain/entities/user_profile.dart';

abstract class UserProfileRepository {

  Future<UserProfile?> fetchUserProfile();

  Future<void> updateUserProfile(UserProfile profile);
}
