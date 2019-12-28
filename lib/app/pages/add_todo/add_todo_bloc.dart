import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:teste_hive/app/pages/home/home_bloc.dart';
import 'package:teste_hive/app/pages/home/home_module.dart';
import 'package:teste_hive/app/shared/models/list_model.dart';
import 'package:teste_hive/app/shared/models/todo_model.dart';

class AddTodoBloc extends BlocBase {
  TextEditingController textEditingController = TextEditingController();
  final TodoModel todoModel;
  ListModel listModel;
  List<TodoModel> todoModelList = List<TodoModel>();
  HomeBloc homeBloc = HomeModule.to.getBloc();

  AddTodoBloc(this.todoModel);

  addTodo({ListModel model}) {
    todoModel.content = textEditingController.text;
    todoModel.id = DateTime.now().microsecondsSinceEpoch;
    model.todos != null ? todoModelList = model.todos : null;
    todoModelList.add(todoModel);
    model.todos = todoModelList;
    homeBloc.updateTodo(model);
  }

  @override
  void dispose() {
    textEditingController.dispose();

    super.dispose();
  }
}
