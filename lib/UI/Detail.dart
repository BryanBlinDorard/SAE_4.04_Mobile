import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sae_flutter/models/FavoriteViewModel.dart';

import '../models/Article.dart';

class Detail extends StatelessWidget{
  final Article? article;
  const Detail(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article?.title ?? ''),
        actions: <Widget>[
          if (context.watch<FavoriteViewModel>().isFavori(article?.getId ?? 0))
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                context.read<FavoriteViewModel>().removeFavori(article?.getId ?? 0);
              },
            )
          else
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                context.read<FavoriteViewModel>().addFavori(article?.getId ?? 0);
              },
            )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Title"),
            subtitle: Text(article?.title ?? ''),
          ),
          ListTile(
            title: Text("Price"),
            subtitle: Text(article?.price.toString() ?? ''),
          ),
          ListTile(
            title: Text("Description"),
            subtitle: Text(article?.description ?? ''),
          ),
          ListTile(
            title: Text("Images"),
            trailing: Image.network(article?.images[0] ?? ''),
          ),
          ListTile(
            title: Text("CreationAt"),
            subtitle: Text(article?.creationAt.toString() ?? ''),
          ),
          ListTile(
            title: Text("UpdatedAt"),
            subtitle: Text(article?.updatedAt.toString() ?? ''),
          ),
          ListTile(
            title: Text("Category"),
            subtitle: Text(article?.category.toString() ?? ''),
          ),
        ],
      ),
    );
  }
}
