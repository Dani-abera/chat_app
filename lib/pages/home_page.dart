import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../component/chat_app_drawer.dart';
import '../service/dropdown_icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout() {
    final authService = AuthService();
    try {
      authService.signOut();
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  final GlobalKey _menuKey = GlobalKey();

  void showDropdownMenu() {
    final RenderBox button =
        _menuKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset(0, button.size.height),
            ancestor: overlay), // Position below the button
        button.localToGlobal(
            button.size.bottomRight(Offset.zero) +
                Offset(0, button.size.height),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    Border.fromBorderSide(BorderSide());
    showMenu(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          child: IconButton(
            padding: EdgeInsets.only(left: 60, right: 0),
            icon: Icon(Icons.logout, color: Colors.blue),
            onPressed: () {
              Navigator.pop(context);
              logout();
            },
          ),
        ),
        PopupMenuItem(
          child: IconButton(
            padding: EdgeInsets.only(left: 60, right: 0),
            icon: Icon(Icons.light_mode, color: Colors.red),
            onPressed: () {
              Navigator.pop(context);
              print("Delete pressed");
            },
          ),
        ),
        PopupMenuItem(
          child: IconButton(
            padding: EdgeInsets.only(left: 60, right: 0),
            icon: Icon(Icons.share, color: Colors.green),
            onPressed: () {
              Navigator.pop(context);
              print("Share pressed");
            },
          ),
        ),
      ],
      color: Colors.transparent,
      elevation: 0,
      //shape: BorderRadius.circular(8);
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ChatAppDrawer(),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            key: _menuKey,
            onPressed: showDropdownMenu,
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
