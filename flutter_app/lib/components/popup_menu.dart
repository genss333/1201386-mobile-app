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
      initialValue: 2,
      child: const Center(
        child: Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ),
      itemBuilder: (context) {
        return List.generate(
          2,
          (index) {
            return PopupMenuItem(
              value: index,
              child: Text('screen ${index + 1}'),
            );
          },
        );
      },
    );
  }
}
