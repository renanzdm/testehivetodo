import 'package:teste_hive/app/pages/lista_todos/lista_todos_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:teste_hive/app/pages/lista_todos/lista_todos_page.dart';

class ListTodosModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ListaTodosBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ListTodosPage();

  static Inject get to => Inject<ListTodosModule>.of();
}
