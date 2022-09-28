import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'player.dart';

class PlayerBox {
  static Box? box;

  static final List<Player> players = [
    Player('Allan', 3, 5, 4294924066),
    Player('Gacien', 4, 6, 4294924066),
    Player('Thomas', 2, 8, 4294924066),
  ];

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(PlayerAdapter());

    box = await Hive.openBox('PlayerBox');

    // box?.clear();
    // verify the state of the box on the app
    var values = box?.values;
    if (values == null || values.isEmpty) {
      // populate the box if it's the first time the app is built
      box?.addAll(players);
    }
  }
}
