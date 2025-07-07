import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:profile_domain/profile_domain.dart';
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
      final fetchProfileUseCase = await GetIt.I.get<FetchUserProfile>().call();
      // final profile = await fetchProfileUseCase();
      emit(ProfileLoaded(fetchProfileUseCase));
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
