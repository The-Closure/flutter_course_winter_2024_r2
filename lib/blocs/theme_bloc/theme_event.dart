part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

final class InitTheme extends ThemeEvent {}

final class ChangeTheme extends ThemeEvent {}
