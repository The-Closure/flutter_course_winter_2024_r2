part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileModel profileModel;

  ProfileSuccess({required this.profileModel});
}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {
  final String errorMessage;

  ProfileError({required this.errorMessage});
}
