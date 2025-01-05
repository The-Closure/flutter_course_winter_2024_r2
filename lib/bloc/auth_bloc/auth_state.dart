part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthStatus extends AuthState {
  final bool authStatus;

  AuthStatus({required this.authStatus});
}

class Laoding extends AuthState {}
