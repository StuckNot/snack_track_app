part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {
  final BuildContext context;
  const LoadProfile(this.context);
}

class SetProfile extends ProfileEvent {


  const SetProfile(this.profile, this.context);
  final UserProfile profile;
  final BuildContext context;


  @override
  List<Object?> get props => [profile];
}
