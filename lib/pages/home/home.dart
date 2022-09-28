import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:munchkin_en_mieux/models/player/player_box.dart';

import 'add_player_dialog.dart';
import 'player_card.dart';
import 'remove_player_dialog.dart';

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
      appBar: AppBar(
        title: const Text('Munchkin En Mieux'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.query_stats),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: box!.listenable(),
              builder: (context, Box box, child) {
                List playersList = box.values.toList();
                inspect(playersList);
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: playersList.length,
                  itemBuilder: (context, index) {
                    return PlayerCard(player: playersList.elementAt(index));
                  },
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AddPlayerDialog(box: box);
                      },
                    );
                  },
                  child: const Text('Add Player'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return RemovePlayerDialog(playersList: box.values.toList(), box: box);
                      },
                    );
                  },
                  child: const Text('Remove Player'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
