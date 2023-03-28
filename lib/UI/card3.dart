import 'package:flutter/material.dart';

class Card3 extends StatelessWidget{
  const Card3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          color: Colors.green,
          child: const Text('Card 3'),
        )
    );
  }
}