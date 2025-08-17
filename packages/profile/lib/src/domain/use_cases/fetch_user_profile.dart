
import 'package:profile/src/domain/entities/user_profile.dart';
import 'package:profile/src/domain/repositories/user_profile_repository.dart';

class FetchUserProfile {

  const FetchUserProfile(this.repository);

  final UserProfileRepository repository;

  Future<UserProfile?> call() async {
    UserProfile? profile = await repository.fetchUserProfile();
    return profile;
  }
}
