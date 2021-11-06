import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  //carregar tema salvo na memória com GetStorage
  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  //salvar tema na memória com GetStorage
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  void switchTheme() {
    //alterando e salvando tema;
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  bool getTheme() {
    return _loadThemeFromBox();
  }

}
