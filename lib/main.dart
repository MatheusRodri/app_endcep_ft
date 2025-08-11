import 'package:app_endcep_ft/core/theme/app_theme.dart';
import 'package:app_endcep_ft/ui/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EndCepApp());
}

class EndCepApp extends StatelessWidget {
  const EndCepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consula de CEP',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
