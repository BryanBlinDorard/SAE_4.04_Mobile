import 'package:flutter/material.dart';
import 'package:sae_flutter/UI/home.dart';


class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bienvenue sur mon application'),
            const Text('Elle a été créée avec Flutter pour la SAE de cette matière'),
            // crée une checkbox et un bouton
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
              },
              child: const Text('Continuer'),
            ),
          ],
        ),
      ),
    );
  }
}