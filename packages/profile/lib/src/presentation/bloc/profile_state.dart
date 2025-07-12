part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {

  const ProfileLoaded(this.profile);
  final Map<String, dynamic> profile;
  // final UserProfile? profile;


  @override
  List<Object?> get props => [profile];
}

class ProfileError extends ProfileState {

  const ProfileError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
