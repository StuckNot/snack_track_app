part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {
  const LoadProfile();
}

class SetProfile extends ProfileEvent {


  const SetProfile(this.profile);
  final UserProfile profile;


  @override
  List<Object?> get props => [profile];
}
