import 'package:profile_domain/src/entities/user_profile.dart';

abstract class UserProfileRepository {

  Future<UserProfile?> fetchUserProfile();

  Future<void> updateUserProfile(UserProfile profile);
}
