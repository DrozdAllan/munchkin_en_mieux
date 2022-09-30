import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/is_epic_provider.dart';
import '../../provider/player_provider.dart';

// TODO: try a consumerWidget

class PlayerCard extends ConsumerStatefulWidget {
  const PlayerCard({Key? key, required this.player}) : super(key: key);

  final Player player;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerCardState();
}

class _PlayerCardState extends ConsumerState<PlayerCard> {
  var level = 1;
  var bonus = 0;

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(playerProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Color(widget.player.colorId), width: 3.0),
        color: Color(widget.player.colorId),
      ),
      margin: const EdgeInsets.only(top: 6.0),
      height: 180.0,
      child: Column(
        children: [
          Text(
            widget.player.name.toString().toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 140.0,
                width: 100.0,
                child: Row(children: [
                  const Icon(Icons.airplanemode_on),
                  SizedBox(
                    height: 140.0,
                    width: 75.0,
                    child: ListWheelScrollView(
                        itemExtent: 52,
                        diameterRatio: 1.2,
                        useMagnifier: true,
                        magnification: 1.4,
                        onSelectedItemChanged: (value) {
                          level = value + 1;
                          notifier.setPower(widget.player.name, level + bonus);
                        },
                        children: ref.watch(isEpicProvider) ? epicLevels : normalLevels),
                  ),
                ]),
              ),
              SizedBox(
                height: 140.0,
                width: 100.0,
                child: Row(children: [
                  const Icon(Icons.push_pin),
                  SizedBox(
                    height: 140.0,
                    width: 75.0,
                    child: ListWheelScrollView(
                        itemExtent: 52,
                        diameterRatio: 1.2,
                        useMagnifier: true,
                        magnification: 1.4,
                        onSelectedItemChanged: (value) {
                          bonus = value;
                          notifier.setPower(widget.player.name, level + bonus);
                        },
                        children: [
                          for (var i = 0; i <= 30; i++)
                            Center(
                              child: Text(
                                i.toString(),
                                style: const TextStyle(fontSize: 38.0),
                              ),
                            ),
                        ]),
                  ),
                ]),
              ),
              SizedBox(
                height: 140.0,
                width: 100.0,
                child: Row(children: [
                  const Icon(Icons.equalizer),
                  SizedBox(
                    height: 140.0,
                    width: 75.0,
                    child: Center(
                      child: Text(
                        widget.player.power.toString(),
                        style: const TextStyle(fontSize: 54.0),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> get normalLevels {
    return [
      for (var i = 1; i <= 10; i++)
        Center(
          child: Text(
            i.toString(),
            style: const TextStyle(fontSize: 38.0),
          ),
        ),
    ];
  }

  List<Widget> get epicLevels {
    return [
      for (var i = 1; i <= 20; i++)
        Center(
          child: Text(
            i.toString(),
            style: const TextStyle(fontSize: 38.0),
          ),
        ),
    ];
  }
}
