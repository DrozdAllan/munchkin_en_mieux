import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/player_provider.dart';

// TODO: transform it to consumerstatefulwidget
class PlayerCard extends StatefulWidget {
  const PlayerCard({Key? key, required this.player}) : super(key: key);

  final Player player;

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  var levels = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var level = 1;
  var bonus = 0;
  ValueNotifier<int> power = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(widget.player.colorId), width: 5.0),
      ),
      margin: const EdgeInsets.all(12.0),
      height: 210.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Text(
              widget.player.name.toString().toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 165.0,
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
                          power.value = level + bonus;
                        },
                        children: [
                          for (var i in levels)
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
                height: 165.0,
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
                          power.value = level + bonus;
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
                height: 165.0,
                width: 100.0,
                child: Row(children: [
                  const Icon(Icons.equalizer),
                  SizedBox(
                    height: 140.0,
                    width: 75.0,
                    child: Center(
                      child: ValueListenableBuilder(
                        valueListenable: power,
                        builder: (context, value, child) =>
                            Text(value.toString(), style: const TextStyle(fontSize: 54.0)),
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
}
