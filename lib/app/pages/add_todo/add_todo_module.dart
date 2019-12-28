import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:teste_hive/app/pages/add_todo/add_todo_bloc.dart';
import 'package:teste_hive/app/pages/add_todo/add_todo_page.dart';
import 'package:teste_hive/app/shared/models/list_model.dart';
import 'package:teste_hive/app/shared/models/todo_model.dart';

class AddTodoModule extends ModuleWidget {
  final ListModel model;

  AddTodoModule(this.model);

  @override
  List<Bloc> get blocs => [
        Bloc((i) => AddTodoBloc(i.getDependency<TodoModel>())),
      ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i)=>TodoModel()),
  ];

  @override
  Widget get view => AddTodoPage(
        listModel: model,
      );

  static Inject get to => Inject<AddTodoModule>.of();
}
