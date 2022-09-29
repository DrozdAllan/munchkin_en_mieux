import 'package:flutter/material.dart';
import 'package:munchkin_en_mieux/pages/home/player_list.dart';
import 'package:munchkin_en_mieux/pages/strategic/strategic.dart';
import 'add_player_dialog.dart';
import 'remove_player_dialog.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Munchkin En Mieux'),
        centerTitle: true,
        actions: [
          IconButton(
            splashRadius: 20.0,
            icon: const Icon(Icons.query_stats),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Strategic(),
                ),
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PlayerList(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AddPlayerDialog(),
                    );
                  },
                  child: const Text('Add Player'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const RemovePlayerDialog(),
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
