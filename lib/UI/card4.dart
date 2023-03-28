import 'package:flutter/material.dart';

class Card4 extends StatelessWidget{
  const Card4({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          color: Colors.purple,
          child: const Text('Card 5'),
        )
    );
  }
}