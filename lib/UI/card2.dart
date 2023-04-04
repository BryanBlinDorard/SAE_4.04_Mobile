import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sae_flutter/UI/detail.dart';
import 'package:sae_flutter/models/Article.dart';



class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

    if (uid == '') {
      return Center(
        child: Text('Vous devez être connecté pour voir vos favoris'),
      );
    }

    // le StreamBuilder permet de récupérer les données de la collection en temps réel, donc dès qu'il y a un changement dans la collection, le StreamBuilder va se mettre à jour
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('favorisUser')
            .where('idUser', isEqualTo: uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return FutureBuilder<List<Article>>(
              future: Article.getFavoriteArticlesFirebase(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // On récupère la liste d'articles
                  List<Article> articles = snapshot.data!;
                  // On retourne un ListView.builder qui va afficher les articles
                  if (articles.length == 0) {
                    return Center(
                      child: Text('Aucun article en favoris'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(articles[index].title),
                            subtitle: Text(articles[index].description),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => detail(
                                    article: articles[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
