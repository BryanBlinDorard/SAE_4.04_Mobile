import 'package:flutter/material.dart';
import 'package:sae_flutter/UI/login_page.dart';
import 'package:sae_flutter/UI/search_page.dart';
import 'package:sae_flutter/UI/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
          if (_selectedIndex == 0)
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Rechercher',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
            ),
          if (_selectedIndex == 0)
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark),
            label: 'Bibliothèque',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Mes favoris',
          ),
          if (FirebaseAuth.instance.currentUser != null)
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Mon Panier',
            ),
          if (FirebaseAuth.instance.currentUser != null)
            const BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Historique d\'achat',
            ),
          if (FirebaseAuth.instance.currentUser != null)
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
