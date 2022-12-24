import 'package:flutter/material.dart';

class ButtonDemos extends StatefulWidget {
  const ButtonDemos({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ButtonDemosState();
  }
}

class _ButtonDemosState extends State<ButtonDemos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        children:[
          // A TextButton has no border or background by default
          TextButton(
            onPressed: () => debugPrint("TextButton pressed"),
            child: Text("Push me"),
          ),

          // The common MaterialButton
          ElevatedButton(
            onPressed: () => debugPrint("ElevatedButton pressed"),
            child: Text("Push me"),
          ),

          Container(height:20),
          
          // Image button isn't a class; use a button with an Image child:
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () => debugPrint("Image Button pressed"),
            child: Image.asset("images/logo.png",
                height:64,
                ),
          ),

          // IconButton to use one of the pre-defined Icons
          IconButton(
            icon: Icon(Icons.add_a_photo_sharp),
            onPressed: () => debugPrint("IconButton pressed"),
          ),
        ]
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint("FAB pressed"),
        child: Icon(Icons.add),
      ),
    );
  }










}
