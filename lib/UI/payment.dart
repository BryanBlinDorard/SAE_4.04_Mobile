import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/Article.dart';
import '../models/Panier.dart';

class payment extends StatelessWidget{
  const payment({super.key});

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    Future<double> prixDuPanier = Panier.prixDuPanier(uid);
    return FutureBuilder(
      future : prixDuPanier,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          double prix = snapshot.data ?? 0.0; // convertir en double
          return Scaffold(
            appBar: AppBar(
              title: Text("Paiement"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Prix du panier: $prix"),
                  ElevatedButton(
                    onPressed: () {
                      Panier.payerPanier(uid, prix);
                      Navigator.pop(context);
                    },
                    child: Text("Payer"),
                  ),
                ],
              ),
            ),
          );
        }else{
          return CircularProgressIndicator();
        }
      },
    );
  }
}