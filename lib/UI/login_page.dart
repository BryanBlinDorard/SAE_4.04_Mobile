import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sae_flutter/UI/signup_page.dart';

import 'home.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
                  (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Se connecter',
                  style: TextStyle(fontSize: 24),
                ),
                FormBuilderTextField(
                  name: 'Email',
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Veuillez entrer un email'),
                    FormBuilderValidators.email(errorText: 'Veuillez entrer un email valide'),
                    FormBuilderValidators.minLength(6, errorText: 'Veuillez entrer un email valide (6 caractères minimum)'),
                  ]),
                ),
                FormBuilderTextField(
                  name: 'password',
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: FormBuilderValidators.required(errorText: 'Veuillez entrer un Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      signIn();
                    }
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Pas encore de compte ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: const Text('S\'inscrire'),
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home()),
            (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e)  {
      print('error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
    }
  }
}
