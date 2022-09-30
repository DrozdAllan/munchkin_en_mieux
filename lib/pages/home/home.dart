import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:munchkin_en_mieux/pages/home/player_list.dart';
import 'package:munchkin_en_mieux/pages/strategic/strategic.dart';
import 'package:munchkin_en_mieux/provider/is_epic_provider.dart';
import 'add_player_dialog.dart';
import 'remove_player_dialog.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Munchkin En Mieux'),
        centerTitle: true,
        leading: IconButton(
          splashRadius: 20.0,
          icon: ref.watch(isEpicProvider)
              ? const Icon(Icons.accessible_forward)
              : const Icon(Icons.accessibility),
          onPressed: () {
            ref.read(isEpicProvider.notifier).update((state) => !state);
          },
        ),
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
