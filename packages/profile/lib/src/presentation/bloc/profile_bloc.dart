import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:profile/src/domain/entities/user_profile.dart';
import 'package:profile/src/domain/use_cases/fetch_user_profile.dart';
import 'package:profile/src/domain/use_cases/update_user_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoading()) {
    on<LoadProfile>(_getProfile);
    on<SetProfile>(_setProfile);
  }

  Future<void> _getProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final profile = await GetIt.I.get<FetchUserProfile>().call();
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> _setProfile(
    SetProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final updateUserProfile = GetIt.I.get<UpdateUserProfile>();
      await updateUserProfile(event.profile);
      add(const LoadProfile());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
