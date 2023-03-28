import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/EcranSettings.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: const EcranSettings(),

    );
  }
}