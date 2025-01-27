import 'package:flutter/material.dart';

class DropdownIconButton {
  final GlobalKey _menuKey = GlobalKey();

  //BuildContext get context => context;

  void showDropdownMenu(BuildContext context) {
    final RenderBox button =
        _menuKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          child: IconButton(
            icon: Icon(Icons.edit, color: Colors.blue),
            onPressed: () {
              Navigator.pop(context);
              print("Edit pressed");
            },
          ),
        ),
        PopupMenuItem(
          child: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              Navigator.pop(context);
              print("Delete pressed");
            },
          ),
        ),
        PopupMenuItem(
          child: IconButton(
            icon: Icon(Icons.share, color: Colors.green),
            onPressed: () {
              Navigator.pop(context);
              print("Share pressed");
            },
          ),
        ),
      ],
    );
  }
}
