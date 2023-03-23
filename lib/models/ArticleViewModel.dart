import 'package:flutter/cupertino.dart';

import 'Article.dart';

class ArticleViewModel extends ChangeNotifier{
  late List<Article> liste;
  ArticleViewModel(){
    liste=[];
  }
  void addArticle(Article article){
    liste.add(article);
    notifyListeners();
  }
  void generateArticle(){
    // Récupère la Future<List<Article>> de la méthode getArticlesAPI de la classe Article
    Article.getArticlesAPI().then((value) {
      liste = value;
      notifyListeners();
    });
  }

  void deleteArticle(int id){
    liste.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
