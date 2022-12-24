import 'package:flutter/material.dart';

class CardDemos extends StatefulWidget {
  const CardDemos({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CardDemosState();
  }
}

class _CardDemosState extends State<CardDemos> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
          children:[
          Icon(Icons.balance_rounded),
          Text("Savings")
        ],)
        ]
      )
    );
  }
}