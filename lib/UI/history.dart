import 'package:flutter/material.dart';
import 'package:sae_flutter/models/Historique.dart';

class historyPage extends StatelessWidget{
  const historyPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Historique>> historiques = Historique.getHistoriqueArticlesFirebase();
    return FutureBuilder(
      future: historiques,
      builder: (BuildContext context, AsyncSnapshot<List<Historique>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.length == 0) {
            return Center(child: Text("Aucun historique"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ExpansionTile(
                    title: Text(snapshot.data![index].date.toString().substring(0, 10) + " - " + snapshot.data![index].date.toString().substring(11, 16)),
                    subtitle: Text(snapshot.data![index].prix.toString() + "€"),
                    children: [
                      for (var article in snapshot.data![index].articles)
                        ListTile(
                          title: Text(article.title),
                          subtitle: Text(article.price.toString() + "€"),
                          leading: Image.network(article.image),
                        )
                    ]
                  ),
                );
              },
            );
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}