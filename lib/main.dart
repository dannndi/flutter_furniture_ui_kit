import 'package:flutter/material.dart';

import 'core/route/app_route.dart';
import 'core/route/app_route_name.dart';
import 'core/theme/app_theme.dart';

/// Follow me on
/// Youtube : Dannndi
/// IG : dannndi.ig
/// Tiktok : dannndi.tt
///
/// Like & Subscribe
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Furniture Shop App",
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      initialRoute: AppRouteName.getStarted,
      onGenerateRoute: AppRoute.generate,
    );
  }
}
