import 'package:flutter/material.dart';

// Simple Wrapper to provide app-bar with back button
// to demonstrate widgets that can then be self-contained.
class Wrapper extends StatelessWidget {
  final String title;
  final Widget demo;
  const Wrapper(this.title, this.demo, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: demo,
    );
  }
}