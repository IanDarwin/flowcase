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
    return Column(
        children: [
          Card(
              color: Colors.greenAccent,
              child: SizedBox(
                  width: 250,
                  height: 100,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () => debugPrint('Savings Card tapped.'),
                    child:
                    Row(
                        children: const [
                          Icon(Icons.account_balance_rounded),
                          Text("Savings")
                        ]
                    ),
                  )
              )
          ),
          Card(
              color: Colors.amberAccent,
              child: SizedBox(
                  width: 250,
                  height: 100,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () => debugPrint('Checking Card tapped.'),
                    child:
                    Row(
                        children: const [
                          Icon(Icons.account_balance_rounded),
                          Text("Checking")
                        ]
                    ),
                  )
              )
          )
        ]
    );
  }
}