import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    List<Text> list = [];
    for (Person p in people) {
      list.add(Text(
        "${p.lastName}, ${p.firstName}",
        style: Theme.of(context).textTheme.headline5,
      ));
    }
    return ListView(
      controller: MyListController(),
      children: list,
    );
  }
}

class MyListController extends ScrollController {
  // Nothing
}