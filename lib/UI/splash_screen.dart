import 'package:flutter/material.dart';
import 'package:sae_flutter/UI/home.dart';
import 'package:sae_flutter/models/SplashScreenViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';


class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bienvenue sur mon application'),
            // crée une checkbox et un bouton
            CheckboxListTile(
              title: Text('Ne plus afficher ce message'),
              value: false,
              onChanged: (value) async {
                SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.setBool('splashScreen', value!);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text('Continuer'),
            ),
          ],
        ),
      ),
    );
  }
}