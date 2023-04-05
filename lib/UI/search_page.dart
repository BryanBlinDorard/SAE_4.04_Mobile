import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sae_flutter/UI/detail.dart';

import '../models/ArticleViewModel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recherche"),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _searchText = value;
              });
            },
            decoration: const InputDecoration(
              hintText: "Rechercher...",
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<ArticleViewModel>()
                  .getArticleBySearch(_searchText)
                  .length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(Provider.of<ArticleViewModel>(context)
                      .getArticleBySearch(_searchText)[index]
                      .title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => detail(
                          article: context.watch<ArticleViewModel>()
                              .getArticleBySearch(_searchText)[index],
                        ),
                      ),
                    );
                  }
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
