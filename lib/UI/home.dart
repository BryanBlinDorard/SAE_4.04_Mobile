import 'package:flutter/material.dart';
import 'package:sae_flutter/UI/login_page.dart';
import 'package:sae_flutter/UI/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'add_article.dart';
import 'card1.dart';
import 'card2.dart';
import 'card3.dart';
import 'card4.dart';
import 'card5.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static List<Widget> pages = <Widget>[
    Card1(),
    Card2(),
    Card3(),
    Card4(),
    Card5(),
  ];


  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HayStore'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Rechercher',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filtre',
            onPressed: () {},
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Paramètres'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()),
                      );
                    },
                  ),
                ),
                if (FirebaseAuth.instance.currentUser != null)
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Se déconnecter'),
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        // actualiser la page
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (Route<dynamic> route) => false,
                        );
                      },
                    ),
                  ),
                if (FirebaseAuth.instance.currentUser == null)
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.login),
                      title: const Text('Se connecter'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                  ),
              ];
            },
          )
        ],
      ),
      body: pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddArticle()),
                );
              },
              tooltip: 'Ajouter',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark),
            label: 'Bibliothèque',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            label: 'Mes favoris',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historique',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explorer',
          ),
          if(user == null)
            const BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Connexion',
            ),
        ],
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
