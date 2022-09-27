import 'package:hive/hive.dart';

part 'player.g.dart';

@HiveType(typeId: 0)
class Player extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int level;
  @HiveField(2)
  final int bonus;
  @HiveField(3)
  final int colorId;

  Player(this.name, this.level, this.bonus, this.colorId);
}
