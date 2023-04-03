import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_task.dart';
import '../models/ArticleViewModel.dart';
import '../models/Article.dart';
import 'detail.dart';

class Card1 extends StatelessWidget{
  late List<Article> articles;
  String tags = '';

  Card1({super.key});
  @override
  Widget build(BuildContext context) {
    articles = context.watch<ArticleViewModel>().liste;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: articles.length,
      itemBuilder: (context, index) => buildImageCard(context, index),
    );
  }

  buildImageCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => detail(article: articles[index])));
      },
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              articles[index].image,
              fit: BoxFit.cover,
            ),
          ),
          )
        ),
    );
  }
}

