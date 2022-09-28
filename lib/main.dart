import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:munchkin_en_mieux/navigator.dart';
import 'package:munchkin_en_mieux/pages/home/home.dart';

import 'models/player/player_box.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PlayerBox.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Munchkin En Mieux',
      theme: FlexThemeData.light(scheme: FlexScheme.mango),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mango),
      themeMode: ThemeMode.system,
      home: const Home(),
      //   onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      //   initialRoute: Home.routeName,
    );
  }
}
