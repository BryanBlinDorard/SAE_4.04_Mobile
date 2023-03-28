import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/Article.dart';

class detail extends StatelessWidget{
  final Article? article;
  const detail(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isUserConnected = FirebaseAuth.instance.currentUser != null;
    // id de l'utilisateur connecté
    String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    // id de l'article
    int articleId = article?.getId ?? 0;
    // isFavori est un Future<bool> qui contient true si l'article est dans la liste des favoris de l'utilisateur connecté
    Future<bool>? isFavori = article?.isFavorisArticle(uid);

    return FutureBuilder(
        future: isFavori,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text(article?.title ?? ''),
                actions: <Widget>[
                  if (snapshot.data == true && isUserConnected)
                    IconButton(
                      icon: const Icon(Icons.favorite),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection("favorisUser")
                            .where('idArticle', isEqualTo: articleId)
                            .where('idUser', isEqualTo: uid)
                            .get()
                            .then((value) {
                          value.docs.forEach((element) {
                            FirebaseFirestore.instance
                                .collection("favorisUser")
                                .doc(element.id)
                                .delete();
                          });
                        });
                      },
                      //TODO actualiser la page
                    )
                  else if (snapshot.data == false && isUserConnected)
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {
                        FirebaseFirestore.instance.collection("favorisUser").add({
                          'idArticle': articleId,
                          'idUser': uid,
                        });
                      },
                    )
                ],
              ),
              body: ListView(
                children: [
                  ListTile(
                    title: const Text("Title"),
                    subtitle: Text(article?.title ?? ''),
                  ),
                  ListTile(
                    title: const Text("Price"),
                    subtitle: Text(article?.price.toString() ?? ''),
                  ),
                  ListTile(
                    title: const Text("Description"),
                    subtitle: Text(article?.description ?? ''),
                  ),
                  ListTile(
                    title: const Text("CreationAt"),
                    subtitle: Text(article?.creationAt.toString() ?? ''),
                  ),
                  ListTile(
                    title: const Text("UpdatedAt"),
                    subtitle: Text(article?.updatedAt.toString() ?? ''),
                  ),
                  ListTile(
                    title: const Text("Category"),
                    subtitle: Text(article?.category.toString() ?? ''),
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text(article?.title ?? ''),
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }
    );
  }
}
