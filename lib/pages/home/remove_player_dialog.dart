import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RemovePlayerDialog extends StatelessWidget {
  const RemovePlayerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 400.0,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Select the player to remove'),
            SizedBox(
              height: 345,
              child: GridView.count(
                padding: const EdgeInsets.only(top: 12.0),
                childAspectRatio: 2,
                crossAxisCount: 2,
                crossAxisSpacing: 25.0,
                mainAxisSpacing: 25.0,
                children: [
                  //   for (Player player in playersList)
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         box.delete(player.key);
                  //         Navigator.pop(context);
                  //       },
                  //       child: Text(
                  //         player.name.toString(),
                  //       ),
                  //     )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
