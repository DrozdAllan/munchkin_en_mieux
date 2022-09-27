import 'package:flutter/material.dart';
import 'package:munchkin_en_mieux/navigator.dart';
import 'package:munchkin_en_mieux/pages/home.dart';
import 'package:munchkin_en_mieux/style.dart';

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
      theme: myTheme,
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      initialRoute: Home.routeName,
    );
  }
}
