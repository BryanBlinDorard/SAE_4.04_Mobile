import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../models/ArticleViewModel.dart';
import '../models/Article.dart';

class EditTask extends StatelessWidget {
  final Article? article;
  EditTask(this.article);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
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
                initialValue: article?.title,
              ),
            ],
          ),
        ),
      ),
    );
  }


}