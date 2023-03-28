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
  void generateArticle() async{
    liste = await Article.getFirebaseArticles();
    notifyListeners();
  }
  void deleteArticle(int id){
    liste.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void updateArticle(Article article){
    liste.removeWhere((element) => element.id == article.id);
    liste.add(article);
    notifyListeners();
  }

  Future<List<Article>> getArticles() async{
    return liste;
  }
}
