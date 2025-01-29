import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/theme_provider.dart';

class ChatAppDrawer extends StatelessWidget {
  const ChatAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.message,
                    size: 60,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Consumer<ThemeProvider>(
                    builder: (context, themeProvider, child) => IconButton(
                      icon: Icon(
                        themeProvider.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onPressed: () => themeProvider.toggleTheme(),
                    ),
                  ),
                ),
              ],
            ),
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
              title: Text('Log Out'),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context);
                AuthService().signOut();
              },
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
