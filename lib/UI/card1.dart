import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EditTask.dart';
import '../models/ArticleViewModel.dart';
import '../models/Article.dart';
import 'Detail.dart';

class Card1 extends StatelessWidget{
  late List<Article> articles;
  String tags = '';
  @override
  Widget build(BuildContext context) {
    articles = context.watch<ArticleViewModel>().liste;
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index)=> Card(
          elevation: 5,
          margin: const EdgeInsets.all(6),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(articles[index].getId.toString()),
            ),
            title: Text(articles[index].title ?? ''),
            subtitle: Text(articles[index].description.length > 25 ? articles[index].description.substring(0, 25) + '...' : articles[index].description),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Detail(articles[index])
              ));
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
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

