part of 'lamp_bloc.dart';

@immutable
sealed class LampState {}

final class LampInitial extends LampState {}


class TurnOn extends LampState {}

class TurnOff extends LampState {}

class LampIsBroken  extends LampState {}