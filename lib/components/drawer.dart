import 'package:flutter/material.dart';
import 'package:uts_app/components/drawer_tile.dart';
import 'package:uts_app/pages/settings_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.local_pizza_sharp,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // home list tile
          AppDrawerTile(
            text: "B e r a n d a",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // settings list tile
          AppDrawerTile(
            text: "P e n g a t u r a n",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),

          const Spacer(),

          // logout list tile
          AppDrawerTile(
            text: "K e l u a r",
            icon: Icons.logout,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
