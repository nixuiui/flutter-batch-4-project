import 'package:flutter/material.dart';
import 'package:flutter_batch_4_project/data/local_storage/theme_local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {

  late final ThemeLocalStorage themeLocalStorage;

  ThemeCubit(
    this.themeLocalStorage
  ) : super(ThemeMode.system);

  init() {
    emit(themeLocalStorage.theme);
  }

  void switchTheme(ThemeMode themeMode) async {
    await themeLocalStorage.setTheme(themeMode);
    emit(themeMode);
  }
}
