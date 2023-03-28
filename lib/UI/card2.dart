import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sae_flutter/models/Article.dart';
import 'package:sae_flutter/models/ArticleViewModel.dart';


class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          color: Colors.purple,
          child: const Text('Card 2'),
        )
    );
  }
}
