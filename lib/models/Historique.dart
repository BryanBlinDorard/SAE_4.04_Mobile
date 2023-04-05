import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Article.dart';

class Historique {
  double prix;
  String uid;
  List<Article> articles;
  DateTime date;
  Historique({required this.prix, required this.uid, required this.articles, required this.date});

  // récupère les articles dans l'historique de l'utilisateur
  static Future<List<Historique>> getHistoriqueArticlesFirebase() async {
    // création d'une liste d'historique
    List<Historique> historiques = [];
    // récupération des documents de la collection historiqueUser ordonnés par date
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("historiqueUser").where("idUser", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    // récupération des Articles
    Future<List<Article>> articles = Article.getFirebaseArticles();
    // récupération des documents
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    // pour chaque document
    for (QueryDocumentSnapshot document in documents) {
      // récupération de la liste des articles
      List<dynamic> articlesId = document['articles'];
      // création d'une liste d'articles
      List<Article> articlesList = [];
      // pour chaque article
      for (Article article in await articles) {
        // si l'id de l'article est dans la liste des articles
        if (articlesId.contains(article.id)) {
          // ajout de l'article à la liste
          articlesList.add(article);
        }
      }
      // ajout de l'historique à la liste
      historiques.add(Historique(
        prix: document['prix'],
        uid: document['idUser'],
        articles: articlesList,
        date: document['date'].toDate(),
      ));
    }
    historiques = trierHistorique(historiques);
    return historiques;
  }

  @override
  String toString() {
    return 'Historique{prix: $prix, uid: $uid, articles: $articles, date: $date}';
  }

  static List<Historique> trierHistorique(List<Historique> historiques) {
    historiques.sort((a, b) => b.date.compareTo(a.date));
    for (var historique in historiques) {
      historique.articles.sort((a, b) => a.title.compareTo(b.title));
    }
    return historiques;
  }

}