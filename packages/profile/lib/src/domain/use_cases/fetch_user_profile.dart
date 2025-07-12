
import 'package:profile/src/domain/entities/user_profile.dart';
import 'package:profile/src/domain/repositories/user_profile_repository.dart';

class FetchUserProfile {

  const FetchUserProfile(this.repository);

  final UserProfileRepository repository;

  Future<Map<String, dynamic>> call() async {
    UserProfile? profile = await repository.fetchUserProfile();
    final data =<String,dynamic>{
      'Name': profile?.name??'',
      'Age': profile?.age??'',
      'Diet': profile?.dietPreference??'',
      'Gender': profile?.gender??'',
      'Weight (kg)': profile?.weightKg??'',
      'Height (cms)': profile?.heightCm??'',
    };
    return data;
  }
}
