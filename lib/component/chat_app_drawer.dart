import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/pages/setting_page.dart';
import 'package:flutter/material.dart';

class ChatAppDrawer extends StatelessWidget {
  const ChatAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Stack(children: [
              Center(
                child: Icon(
                  Icons.message,
                  size: 60,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.light_mode),
              )
            ]),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
            child: ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SettingPage(),
                  ),
                );
              },
            ),
          ),
          Spacer(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
            child: ListTile(
              title: Text('LogOut'),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context);
                AuthService().signOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
