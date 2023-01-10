import 'package:counter_demo/settings_page.dart';
import 'package:counter_demo/wrapper.dart';
import 'package:flutter/material.dart';

import 'about.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  build(context) {
    return Drawer(
      child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  image: DecorationImage(
                      fit: BoxFit.none,
                      image: AssetImage('images/logo.png'))
              ),
              child: Text(
                'FlutterDemos Menu',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.input),
              title: const Text('FlutterDemos Intro/Help'),
              onTap: () => {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const SettingsPage()))
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About FlutterDemos'),
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const Wrapper('About FlutterDemos', About())))
              }
            ),
          ]),
    );
  }
}
