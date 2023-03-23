import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';


class AddArticle extends StatelessWidget{
  AddArticle({super.key});
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Center(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'title',
                validator: FormBuilderValidators.required(errorText: 'Veuillez entrer un titre'),
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              FormBuilderTextField(
                name: 'difficulty',
                // faut
                validator: FormBuilderValidators.required(errorText: 'Veuillez entrer une difficulté'),
                decoration: const InputDecoration(labelText: 'Difficulty'),
                initialValue: '1',
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              FormBuilderTextField(
                name: 'nbhours',
                decoration: const InputDecoration(labelText: 'Nbhours'),
                initialValue: '1',
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              FormBuilderTextField(
                name: 'description',
                validator: FormBuilderValidators.required(errorText: 'Veuillez entrer une description'),
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              FormBuilderTextField(
                name: 'tags',
                validator: FormBuilderValidators.required(errorText: 'Veuillez entrer des tags'),
                decoration: const InputDecoration(labelText: 'Tags'),
              ),
              ElevatedButton(
                onPressed: () {
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        )
      ),
    ) ;
  }
}