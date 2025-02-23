import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeLocalStorage {

  late final Box box;

  ThemeLocalStorage(this.box);

  ThemeMode get theme {
    final options = {
      "dark": ThemeMode.dark,
      "light": ThemeMode.light,
      "system": ThemeMode.system,
    };
    final str = box.get("theme");
    return options[str] ?? ThemeMode.system;
  }

  Future<void> setTheme(ThemeMode data) async {
    await box.put("theme", data.name);
  }

}