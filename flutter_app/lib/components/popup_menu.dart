import 'package:flutter/material.dart';

class PopUpMenuButtonComponent extends StatefulWidget {
  const PopUpMenuButtonComponent({
    super.key,
    required this.onSelected,
  });

  final Function(int value) onSelected;

  @override
  State<PopUpMenuButtonComponent> createState() =>
      _PopUpMenuButtonComponentState();
}

class _PopUpMenuButtonComponentState extends State<PopUpMenuButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        widget.onSelected(value);
      },
      child: const Center(
        child: Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ),
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            value: 1,
            child: Row(
              children: const [
                Icon(
                  Icons.emoji_emotions,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 4,
                ),
                Text('Icon'),
              ],
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Row(
              children: const [
                Icon(
                  Icons.abc,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 4,
                ),
                Text('Text'),
              ],
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: Row(
              children: const [
                Icon(
                  Icons.girl,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 4,
                ),
                Text('girl'),
              ],
            ),
          ),
          PopupMenuItem(
            value: 4,
            child: Row(
              children: const [
                Icon(
                  Icons.man,
                  color: Colors.pink,
                ),
                SizedBox(
                  width: 4,
                ),
                Text('man'),
              ],
            ),
          ),
        ];
      },
    );
  }
}
