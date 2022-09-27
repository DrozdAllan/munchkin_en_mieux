import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:munchkin_en_mieux/models/player/player_box.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var box = PlayerBox.box;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 42.0),
              child: Text('Munchkin En Mieux'),
            ),
            ValueListenableBuilder(
              valueListenable: box!.listenable(),
              builder: (context, value, child) {
                List playersList = box.values.toList();
                //   inspect(playersList);
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: playersList.length,
                  itemBuilder: (context, index) {
                    return PlayerCard(name: playersList.elementAt(index).name.toString());
                  },
                );
              },
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: const Text('Add Player'),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerCard extends StatefulWidget {
  const PlayerCard({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  var levels = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var bonuses = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var level = 1;
  var bonus = 0;
  ValueNotifier<int> power = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.blue),
      margin: const EdgeInsets.only(bottom: 12.0),
      height: 200.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Text(
              widget.name.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 170.0,
                width: 70.0,
                child: Column(children: [
                  const Text('Level'),
                  SizedBox(
                    height: 140.0,
                    width: 70.0,
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
                                style: const TextStyle(fontSize: 48.0),
                              ),
                            ),
                        ]),
                  ),
                ]),
              ),
              SizedBox(
                height: 170.0,
                width: 70.0,
                child: Column(children: [
                  const Text('Bonus'),
                  SizedBox(
                    height: 140.0,
                    width: 70.0,
                    child: ListWheelScrollView(
                        itemExtent: 52,
                        diameterRatio: 1.2,
                        useMagnifier: true,
                        magnification: 1.4,
                        onSelectedItemChanged: (value) {
                          bonus = value + 1;
                          power.value = level + bonus;
                        },
                        children: [
                          for (var i in bonuses)
                            Center(
                              child: Text(
                                i.toString(),
                                style: const TextStyle(fontSize: 48.0),
                              ),
                            ),
                        ]),
                  ),
                ]),
              ),
              SizedBox(
                height: 170.0,
                width: 80.0,
                child: Column(children: [
                  const Text('Power'),
                  SizedBox(
                    height: 140.0,
                    width: 80.0,
                    child: Center(
                      child: ValueListenableBuilder(
                        valueListenable: power,
                        builder: (context, value, child) =>
                            Text(value.toString(), style: const TextStyle(fontSize: 68.0)),
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
