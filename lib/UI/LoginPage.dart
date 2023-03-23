import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';


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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormBuilderTextField(
                name: 'username',
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: FormBuilderValidators.required(errorText: 'Veuillez entrer un Username'),
              ),
              FormBuilderTextField(
                name: 'password',
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: FormBuilderValidators.required(errorText: 'Veuillez entrer un Password'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Submit'),
              ),
            ],
          ),
        )
      ),
    );
  }
}
