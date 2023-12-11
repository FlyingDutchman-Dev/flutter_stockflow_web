import 'package:flutter/material.dart';

class Falha extends StatefulWidget {
  const Falha({super.key});

  @override
  State<Falha> createState() => _FalhaState();
}

class _FalhaState extends State<Falha> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Card(
        child: Center(child: Text("Falha")),
      ),
    );
  }
}
