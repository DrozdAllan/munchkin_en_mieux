import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:munchkin_en_mieux/pages/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
    );
  }
}
