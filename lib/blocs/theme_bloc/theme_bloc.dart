import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_map_animation/core/config/di.dart';
import 'package:theme_map_animation/core/theme/app_theme.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(AppTheme.lightTheme) {
    on<InitTheme>((event, emit) {
      bool isDark = sl.get<SharedPreferences>().getBool('is_dark') ?? false;
      emit(
        isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      );
      // sl.get<SharedPreferences>().setBool('is_dark', isDark);
    });
    on<ChangeTheme>(
      (event, emit) {
        // bool isDark = sl.get<SharedPreferences>().getBool('is_dark')!;
        bool isDark = state == AppTheme.darkTheme;
        emit(isDark ? AppTheme.lightTheme : AppTheme.darkTheme);
        sl.get<SharedPreferences>().setBool('is_dark', !isDark);
      },
    );
  }
}
