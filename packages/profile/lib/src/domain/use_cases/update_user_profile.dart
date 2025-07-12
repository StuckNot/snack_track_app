
import 'package:profile/src/domain/entities/user_profile.dart';
import 'package:profile/src/domain/repositories/user_profile_repository.dart';

class UpdateUserProfile {
  final UserProfileRepository repository;

  const UpdateUserProfile(this.repository);

  Future<void> call(UserProfile profile) => repository.updateUserProfile(profile);
}
