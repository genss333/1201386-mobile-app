import 'package:flutter/material.dart';

class PopUpMenuButtonComponent extends StatefulWidget {
  const PopUpMenuButtonComponent({super.key});

  @override
  State<PopUpMenuButtonComponent> createState() =>
      _PopUpMenuButtonComponentState();
}

class _PopUpMenuButtonComponentState extends State<PopUpMenuButtonComponent> {
  String menuName = "";

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        setState(() {
          menuName = value.toString();
          if (menuName == "0") {
          } else {}
        });
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
