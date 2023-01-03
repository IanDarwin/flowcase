import 'package:counter_demo/drag_drop.dart';
import 'package:counter_demo/layout_demos.dart';
import 'package:counter_demo/login_screen.dart';
import 'package:counter_demo/nav_drawer.dart';
import 'package:counter_demo/tab_demo.dart';
import 'package:counter_demo/text_demos.dart';
import 'package:counter_demo/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'about.dart';
import 'animation_demo.dart';
import 'button_demos.dart';
import 'card_demos.dart';
import 'dialog_demos.dart';
import 'list_demos.dart';
import 'list_tile_demo.dart';
import 'table_demo.dart';

void main() async {
  Settings.init();
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var shape = MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )
    );
    return Scaffold(
      appBar: AppBar(
        key: _scaffoldKey,
        title: Text(widget.title),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => alert(context, "Search disabled", title: "Sorry"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
        ],
      ),
      drawer: const NavDrawer(),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        children: [
          // Most of these use our own Wrapper but a few do not; edit w/ care.
          ElevatedButton(
            style: ButtonStyle(shape: shape),
            child: const Text("Button Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                  const Wrapper('Push My Buttons', ButtonDemos())));
            },
          ),
          ElevatedButton(
            style: ButtonStyle(shape: shape),
            child: const Text("Card Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const Wrapper('Cards', CardDemos())));
            },
          ),
          ElevatedButton(
            style: ButtonStyle(shape: shape),
            child: const Text("Dialog Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                  const Wrapper('Dialog', DialogDemos())));
            },
          ),
          ElevatedButton(
            style: ButtonStyle(shape: shape),
            child: const Text("Drag-n-Drop Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                  const Wrapper('Shop til you drop', DragDropDemo())));
            },
          ),
          ElevatedButton(
            style: ButtonStyle(shape: shape),
            child: const Text("Layout Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                  const Wrapper('Layouts', LayoutDemos())));
            },
          ),
          ElevatedButton(
            style: ButtonStyle(shape: shape),
            child: const Text("List Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const Wrapper('Lists', ListDemos())));
            },
          ),
          ElevatedButton(
            style: ButtonStyle(shape: shape),
            child: const Text("ListTile Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                  const Wrapper('ListTile', ListTileDemos())));
            },
          ),
          ElevatedButton(
            style: ButtonStyle(shape: shape),
            child: const Text("Login Screen Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      Wrapper('Login Screen', AuthForm(key: UniqueKey()))));
            },
          ),
          ElevatedButton(
            style: ButtonStyle(shape: shape),
            child: const Text("SnackBar Demo"),
            onPressed: () { // Done here in main Widget
              showUndoSnackbar(context, "Deleted Item #123", () => {});
            },
          ),
          ElevatedButton(
            style: ButtonStyle(shape: shape),
            child: const Text("Table Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const Wrapper('Tables', TableDemo())));
            },
          ),
          ElevatedButton(
            style: ButtonStyle(shape: shape),
            child: const Text("Tabs Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                // Does not need Wrapper()
                  builder: (context) => const TabsDemo()));
            },
          ),
          ElevatedButton(
            style: ButtonStyle(shape: shape),
            child: const Text("Text Demo"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const Wrapper('Text', TextDemos())));
            },
          ),
          ElevatedButton(
            style: ButtonStyle(shape: shape),
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
                  builder: (context) => const Wrapper('About LTDemo', About())));
            },
          ),
        ],
      ),
    );
  }
}

void showUndoSnackbar(BuildContext context, String message, Function undoer) {
  final snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          debugPrint("Undoing '$message'");
          undoer();
        }
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

