import 'package:flutter/material.dart';
import '../models/EcranSettings.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const EcranSettings(),
    );
  }
}