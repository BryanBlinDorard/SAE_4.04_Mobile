import 'package:flutter/material.dart';

class Card5 extends StatelessWidget{
  const Card5({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          color: Colors.purple,
          child: const Text('Card 4'),
        )
    );
  }
}