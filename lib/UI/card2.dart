import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sae_flutter/models/Article.dart';
import 'package:sae_flutter/models/ArticleViewModel.dart';

import '../models/FavoriteViewModel.dart';

class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<List<int>> articles = context.watch<FavoriteViewModel>().getFavoris();
    Future<List<Article>> articlesAPI = context.watch<ArticleViewModel>().getArticles();

    return FutureBuilder(
        future: Future.wait([articles, articlesAPI]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            List<int> favoris = snapshot.data![0];
            List<Article> articles = snapshot.data![1];
            if (favoris.length == 0) {
              return Center(
                child: Text("Aucun favoris"),
              );
            } else {
              return ListView.builder(
                  itemCount: favoris.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.favorite),
                        title: Text(articles[index].title),
                        subtitle: Text(articles[index].description),
                        onTap: () {
                          context.read<FavoriteViewModel>().removeFavori(favoris[index]);
                        },
                      ),
                    );
                  });
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
