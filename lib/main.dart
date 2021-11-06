import 'package:clone_instagram/pages/root_app.dart';
import 'package:clone_instagram/service/theme_service.dart';
import 'package:clone_instagram/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: RootApp(),
    );
  }
}

