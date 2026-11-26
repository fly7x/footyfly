import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/home_screen.dart';

class FootyFlyApp extends StatelessWidget {
  const FootyFlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FootyFly',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const HomeScreen(),
    );
  }
}
