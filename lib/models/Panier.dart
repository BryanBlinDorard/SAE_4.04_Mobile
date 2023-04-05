
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Article.dart';

class Panier {
  static Future<bool> isPanierArticle(String uidUser, int id) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("panierUser").where("idUser", isEqualTo: uidUser).get();
    for (var panier in querySnapshot.docs) {
      Map<String, dynamic>? panierData = panier.data() as Map<String, dynamic>?;
      if (panierData != null) {
        if (panierData['idArticle'] == id) {
          return true;
        }
      }
    }
    return false;
  }

  static void addPanierArticle(String uid, int id) {
    FirebaseFirestore.instance.collection("panierUser").add({
      "idUser": uid,
      "idArticle": id,
    });
    print("Article $id est dans le panier de l'utilisateur $uid");
  }

  static Future<List<Article>> getPanierArticlesFirebase() async {
    List<Article> articles = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("panierUser").where("idUser", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    for (QueryDocumentSnapshot document in documents) {
      int id = document['idArticle'];
      List<Article> firebaseArticles = await Article.getFirebaseArticles();
      for (Article article in firebaseArticles) {
        if (article.id == id) {
          articles.add(article);
        }
      }
    }
    return articles;
  }

  static void removePanierArticle(String uid, int id) {
    FirebaseFirestore.instance.collection("panierUser").where("idUser", isEqualTo: uid).where("idArticle", isEqualTo: id).get().then((value) {
      for (var element in value.docs) {
        FirebaseFirestore.instance.collection("panierUser").doc(element.id).delete();
      }
    });
    print("Article $id n'est plus dans le panier de l'utilisateur $uid");
  }

  static void updatePanierStatus(String uid, bool inPanier, int id) {
    if (inPanier) {
      addPanierArticle(uid, id);
    } else {
      removePanierArticle(uid, id);
    }
  }

  static Future<double> prixDuPanier(String uid) async {
    double prix = 0;
    QuerySnapshot panierSnapshot = await FirebaseFirestore.instance.collection("panierUser").where("idUser", isEqualTo: uid).get();
    for(DocumentSnapshot panierDoc in panierSnapshot.docs) {
      QuerySnapshot articleSnapshot = await FirebaseFirestore.instance.collection("articles").where("id", isEqualTo: panierDoc['idArticle']).get();
      for(DocumentSnapshot articleDoc in articleSnapshot.docs) {
        prix += articleDoc['price'];
      }
    }
    return prix;
  }


  static void payerPanier(String uid, double prix) async {
    List<int> articlesID = await getIDPanierArticlesFirebase();
    // ajoute l'historique
    FirebaseFirestore.instance.collection("historiqueUser").add({
      "idUser": uid,
      "prix": prix,
      "articles": articlesID,
      "date": DateTime.now(),
    });
    // vide le panier
    QuerySnapshot panierSnapshot = await FirebaseFirestore.instance.collection("panierUser").where("idUser", isEqualTo: uid).get();
    for(DocumentSnapshot panierDoc in panierSnapshot.docs) {
      FirebaseFirestore.instance.collection("panierUser").doc(panierDoc.id).delete();
    }
  }

  static Future<List<int>> getIDPanierArticlesFirebase() async {
    List<int> articles = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("panierUser").where("idUser", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    for (QueryDocumentSnapshot document in documents) {
      int id = document['idArticle'];
      articles.add(id);
    }
    return articles;
  }
}