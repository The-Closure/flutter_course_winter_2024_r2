part of 'lamp_bloc.dart';

@immutable
sealed class LampEvent {}


class ChangeColor extends LampEvent {}