import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) {
    if (!isClosed) {
      emit(themeMode);
    }
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    try {
      final mode = json['theme'] as String?;
      switch (mode) {
        case 'light':
          return ThemeMode.light;
        case 'dark':
          return ThemeMode.dark;
        default:
          return ThemeMode.system;
      }
    } catch (e) {
      return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    if (isClosed) return null;

    try {
      late final String themeString;
      switch (state) {
        case ThemeMode.light:
          themeString = 'light';
          break;
        case ThemeMode.dark:
          themeString = 'dark';
          break;
        default:
          themeString = 'system';
      }
      return {'theme': themeString};
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> close() async {
    // Ensure state is saved before closing
    await super.close();
  }
}
