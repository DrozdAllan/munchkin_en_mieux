import 'package:hive_flutter/hive_flutter.dart';
import 'player.dart';

class PlayerBox {
  static Box? box;

  static final List<Player> players = [
    Player('Allan', 3, 5, 1),
    Player('Gacien', 4, 6, 2),
    Player('Thomas', 2, 8, 4),
    Player('BenjaminTesPutainDeChaussures', 0, 0, 0)
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
