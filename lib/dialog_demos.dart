import 'package:flutter/material.dart';

class DialogDemos extends StatefulWidget {
  const DialogDemos({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DialogDemosState();
  }
}

class _DialogDemosState extends State<DialogDemos> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          // A TextButton has no border or background by default
          Center(child:ElevatedButton(
            onPressed: () => alert(context, 'A Silly Message', title: "Dialog Demo"),
            child: const Text("Single Button Dialog"),
          )),
          Center(child: ElevatedButton(
            child: const Text("Two Button Dialog"),
            onPressed: () => alertWithActions(context, 'A Smarter Message',
                <Widget>[
                  ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close Button"),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Another Close Button"),
                  ),
                ],
                title: "Two Buttons"),
          )),
        ],
    );
  }
}

alert(BuildContext context, String message, {title = 'Error', myActions}) async {
  var actions = myActions ?? <Widget>[];
  showDialog<int>(
      context: context,
      barrierDismissible: false, // must tap a button to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      }
  );
}

alertWithActions(BuildContext context, String message,  actions,
    {title = 'Error'}) {
  showDialog<int>(
      context: context,
      barrierDismissible: false, // must tap a button to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            // SingleChildScrollView only needed if content large
            child: Text(message),
          ),
          actions: actions,
        );
      }
  );
}

