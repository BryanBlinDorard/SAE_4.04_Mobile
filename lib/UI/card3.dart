import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sae_flutter/UI/payment.dart';

import '../models/Article.dart';
import '../models/Panier.dart';
import 'detail.dart';

class Card3 extends StatelessWidget{
  const Card3({Key? key});

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

    // le StreamBuilder permet de récupérer les données de la collection en temps réel, donc dès qu'il y a un changement dans la collection, le StreamBuilder va se mettre à jour
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => payment(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text('Payer le panier'),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('panierUser')
                  .where('idUser', isEqualTo: uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return FutureBuilder<List<Article>>(
                    future: Panier.getPanierArticlesFirebase(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // On récupère la liste d'articles
                        List<Article> articles = snapshot.data!;
                        // On retourne un ListView.builder qui va afficher les articles
                        if (articles.length == 0) {
                          return Center(
                            child: Text('Aucun article dans votre panier'),
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
          ),
        ],
      ),
    );
  }
}
