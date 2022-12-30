import 'package:flutter/material.dart';

import 'dialog_demos.dart';

class ListDemos extends StatefulWidget {
  const ListDemos({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListDemosState();
  }
}

class Person {
  final String firstName, lastName;
  const Person(this.firstName, this.lastName);
}

List<Person> people = [
  const Person("Boris", "Johnson"),
  const Person("Annie", "Smith"),
  const Person("Robin", "Jones"),
  const Person("Ethiah", "Jenkins"),
  const Person("J.", "Adams"),
  const Person("George", "Washington"),
  const Person("Barack", "Obama"),
  const Person("Volodymyr", "Zelensky"),
  const Person("Ian", "Darwin"),
  const Person("Bill", "The Cat"),
  const Person("Julian", "Lightray"),
  const Person("Christopher", "Gomersall"),
  const Person("Donald", "Knuth"),
  const Person("Edward", "Teller")
];

class ListDemosState extends State<ListDemos> {
  Offset _pos = Offset.zero;
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (Person p in people) {
      list.add(GestureDetector(
        onTapDown: (pos) {_getTapPosition(pos);},
        onTap: () => alert(context, "No details available", title: "Details"),
        onLongPress: () async {
          final RenderObject? overlay =
            Overlay.of(context)?.context.findRenderObject();
          await showMenu(
            context: context,
            position: RelativeRect.fromRect(
                Rect.fromLTWH(_pos.dx, _pos.dy, 50, 50),
                Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                    overlay.paintBounds.size.height)),
            items: <PopupMenuEntry>[
              PopupMenuItem(
                onTap: () async => _edit(context),
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.edit),
                    Text("Edit"),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () async => _delete(context),
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.delete),
                    Text("Delete"),
                  ],
                ),
              ),
            ],
          );
        },
        child: Text(
          "${p.lastName}, ${p.firstName}",
          style: Theme.of(context)
              .textTheme
              .headline5,
        ),
      )
      );
    }
    return ListView(
      children: list,
    );
  }

  void _getTapPosition(TapDownDetails tapPosition) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    _pos = referenceBox.globalToLocal(tapPosition.globalPosition);
  }

  _edit(context) async {
    debugPrint("Edit");
    Navigator.pop(context);
    alert(context, "Read-only, sorry", title: "No can do");
  }

  _delete(context) async {
    debugPrint("Delete");
    alert(context, "Read-only, sorry", title: "No can do");
    Navigator.pop(context);
  }
}
