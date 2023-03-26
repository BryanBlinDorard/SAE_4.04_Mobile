import 'dart:convert';

import 'package:http/http.dart' as http;
import 'Category.dart';

class Article {
  static int nb = 0;
  int id;
  String title;
  int price;
  String description;
  List<dynamic> images;
  String creationAt;
  String updatedAt;
  Category category;

  Article({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });

  factory Article.newArticle() {
    nb++; //attribut static de la classe.
    return Article(
      id: nb,
      title: 'Article $nb',
      price: 100,
      description: 'Description de l\'article $nb',
      images: ['https://picsum.photos/200/300'],
      creationAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
      category: Category(id: 1, name: 'Category 1'),
    );
  }

  factory Article.newArticleWithArgs({
    required String title,
    required int price,
    required String description,
    required List<dynamic> images,
    required String creationAt,
    required String updatedAt,
    required Category category,
  }) {
    nb++; //attribut static de la classe.
    return Article(
      id: nb,
      title: title,
      price: price,
      description: description,
      images: images,
      creationAt: creationAt,
      updatedAt: updatedAt,
      category: category,
    );
  }

  static List<Article> generateArticle(int i) {
    List<Article> liste = [];
    for (int j = 0; j < i; j++) {
      liste.add(Article.newArticle());
    }
    return liste;
  }

  int get getId => id;

  static Future<List<Article>> getArticlesAPI() async {
    // Création d'une liste d'articles
    List<Article> articles = [];

    await Future.delayed(Duration(seconds: 2));
    final String apiUrl = 'https://api.escuelajs.co/api/v1/products';

    // Envoi de la requête GET
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Conversion de la réponse en JSON
      final jsonData = jsonDecode(response.body);
      // Parcours de la liste des articles
      for (var item in jsonData) {
        // Création d'un article
        final article = Article.newArticleWithArgs(
          title: item['title'],
          price: item['price'],
          description: item['description'],
          images: item['images'],
          creationAt: item['creationAt'],
          updatedAt: item['updatedAt'],
          category: Category(
              id: item['category']['id'], name: item['category']['name']),
        );
        // Ajout de l'article à la liste
        articles.add(article);
      }
    } else {
      print('Erreur de récupération des données : ${response.statusCode}');
    }
    return articles;
  }

  toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'images': images,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
      'category': category.toJson(),
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return Article.newArticleWithArgs(
      title: json['title'],
      price: json['price'],
      description: json['description'],
      images: json['images'],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
      category: Category(
          id: json['category']['id'], name: json['category']['name']),
    );
  }

  @override
  String toString() {
    return 'Article{id: $id, title: $title, price: $price, description: $description, images: $images, creationAt: $creationAt, updatedAt: $updatedAt, category: $category}';
  }
}