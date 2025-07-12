import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:profile/l10n/l10n.dart';
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
      final l10n = event.context.l10n;
      final profile = await GetIt.I.get<FetchUserProfile>().call();
      final data =<String,dynamic>{
        l10n.profileNameTitle: profile?.name??'',
        l10n.profileAgeTitle: profile?.age??'',
        l10n.profileDietTitle: profile?.dietPreference??'',
        l10n.profileGenderTitle: profile?.gender??'',
        l10n.profileWeightTitle: profile?.weightKg??'',
        l10n.profileHeightTitle: profile?.heightCm??'',
      };
      emit(ProfileLoaded(data));
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
      add( LoadProfile(event.context));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
