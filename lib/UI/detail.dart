import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Article.dart';

class detail extends StatefulWidget {
  final Article article;

  detail({required this.article});

  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detail> {
  bool isFavorite = false;
  String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    // mettez à jour l'état de l'article dans Firebase
    // en utilisant l'ID de l'utilisateur actuel
    widget.article.updateFavoriteStatus(uid, isFavorite);
  }

  @override
  void initState() {
    super.initState();
    // initialiser l'état de l'article en fonction de sa valeur dans Firebase
    String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    widget.article.isFavorisArticle(uid).then((value) {
      setState(() {
        isFavorite = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de l\'article'),
        actions: <Widget>[
          if (uid != '')
            IconButton(
              icon: Icon(
                isFavorite ? Icons.star : Icons.star_border,
              ),
              onPressed: _toggleFavorite,
            ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Title"),
            subtitle: Text(widget.article.title),
          ),
          ListTile(
            title: const Text("Price"),
            subtitle: Text(widget.article.price.toString() + " €"),
          ),
          ListTile(
            title: const Text("Description"),
            subtitle: Text(widget.article.description),
          ),
          ListTile(
            title: const Text("CreationAt"),
            subtitle: Text(widget.article.creationAt.toString()),
          ),
          ListTile(
            title: const Text("UpdatedAt"),
            subtitle: Text(widget.article.updatedAt.toString()),
          ),
          ListTile(
            title: const Text("Category"),
            subtitle: Text(widget.article.category.toString()),
          ),
          ListTile(
            title: const Text("Image"),
            trailing: Image.network(widget.article.image),
          ),
        ],
      ),
    );
  }
}
