import 'package:counter_demo/wrapper.dart';
import 'package:flutter/material.dart';

import 'about.dart';

class NavDrawer extends StatelessWidget {

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
                'MyApp Menu',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.input),
              title: const Text('MyApp Intro/Help'),
              onTap: () => {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About MyApp'),
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Wrapper('About LTDemo', About())))
              }
            ),
          ]),
    );
  }
}
