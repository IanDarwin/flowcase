import 'package:counter_demo/drag_drop.dart';
import 'package:counter_demo/layout_demos.dart';
import 'package:counter_demo/login_screen.dart';
import 'package:counter_demo/nav_drawer.dart';
import 'package:counter_demo/tab_demo.dart';
import 'package:counter_demo/text_demos.dart';
import 'package:counter_demo/wrapper.dart';
import 'package:flutter/material.dart';

import 'about.dart';
import 'animation_demo.dart';
import 'button_demos.dart';
import 'card_demos.dart';
import 'dialog_demos.dart';
import 'list_demos.dart';
import 'list_tile_demo.dart';
import 'table_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LT Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Learning Tree Flutter Demo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(
            Icons.menu, // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                debugPrint("Search Tap");
              },
              child: const Icon(
                Icons.search,
                size: 26.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(
                  Icons.more_vert
              ),
            ),
          ),
        ],
      ),
      drawer: NavDrawer(),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
        padding: EdgeInsets.all(10),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        children: [
          // Most of these use our own Wrapper but a few do not; edit w/ care.
          ElevatedButton(
            child: const Text("Button Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                  const Wrapper('Push My Buttons', ButtonDemos())));
            },
          ),
          ElevatedButton(
            child: const Text("Card Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const Wrapper('Cards', CardDemos())));
            },
          ),
          ElevatedButton(
            child: const Text("Dialog Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                  const Wrapper('Dialog', DialogDemos())));
            },
          ),
          ElevatedButton(
            child: const Text("Drag-n-Drop Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                  const Wrapper('Shop til you drop', DragDropDemo())));
            },
          ),
          ElevatedButton(
            child: const Text("Layout Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                  const Wrapper('Layouts', LayoutDemos())));
            },
          ),
          ElevatedButton(
            child: const Text("List Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const Wrapper('Lists', ListDemos())));
            },
          ),
          ElevatedButton(
            child: const Text("ListTile Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                  const Wrapper('ListTile', ListTileDemos())));
            },
          ),
          ElevatedButton(
            child: const Text("Login Screen Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      Wrapper('Login Screen', AuthForm(key: UniqueKey()))));
            },
          ),
          ElevatedButton(
            child: const Text("SnackBar Demo"),
            onPressed: () { // Done here in main Widget
              showUndoSnackbar(context, "Deleted Item #123");
            },
          ),
          ElevatedButton(
            child: const Text("Table Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Wrapper('Tables', TableDemo())));
            },
          ),
          ElevatedButton(
            child: const Text("Tabs Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                // Does not need Wrapper()
                  builder: (context) => TabsDemo()));
            },
          ),
          ElevatedButton(
            child: const Text("Text Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const Wrapper('Text', TextDemos())));
            },
          ),
          ElevatedButton(
            child: const Text("Animation"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const Wrapper('Text', AnimationApp())));
            },
          ),
          TextButton(
            child: const Text("About"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Wrapper('About LTDemo', About())));
            },
          ),
        ],
      ),
    );
  }
}

void showUndoSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: "Undo",
      onPressed: () => debugPrint("Would undo '$message'"),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

