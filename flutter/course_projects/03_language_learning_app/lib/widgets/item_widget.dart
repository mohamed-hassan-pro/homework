import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../models/item_model.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item, required this.color});
  final ItemModel item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (item.image != null)
          ColoredBox(
            color: const Color(0xfffff6dc),
            child: Image.asset(item.image!, height: 72, width: 72),
          ),
        Expanded(
          child: ListTile(
            tileColor: color,
            title: Text(item.jpName, style: const TextStyle(color: Colors.white)),
            subtitle: Text(item.enName, style: const TextStyle(color: Colors.white)),
            trailing: IconButton(
              onPressed: () {},
              icon: IconButton(
                icon: const Icon(Icons.play_arrow, color: Colors.white),
                onPressed: () {
                  AudioPlayer player = AudioPlayer();
                  player.play(AssetSource(item.sound));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
