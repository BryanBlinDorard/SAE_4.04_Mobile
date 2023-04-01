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
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index)=> Card(
          elevation: 5,
          margin: const EdgeInsets.all(6),
          child: ListTile(
            title: Text(articles[index].title),
            subtitle: Text(articles[index].description.length > 30 ? '${articles[index].description.substring(0, 30)}...' : articles[index].description),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => detail(article: articles[index])
              ));
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context.read<ArticleViewModel>().deleteArticle(articles[index].getId);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: ()  {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => EditTask(articles[index])
                    ));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

