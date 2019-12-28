import 'package:flutter/material.dart';
import 'package:teste_hive/app/pages/add_todo/add_todo_bloc.dart';
import 'package:teste_hive/app/pages/add_todo/add_todo_module.dart';
import 'package:teste_hive/app/shared/models/list_model.dart';

class AddTodoDialog extends StatelessWidget {
  final ListModel listModel;
  AddTodoDialog({this.listModel});

  @override
  Widget build(BuildContext context) {

    var todoBloc = AddTodoModule.to.getBloc<AddTodoBloc>();

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: EdgeInsets.all(12),
      actions: <Widget>[],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: todoBloc.textEditingController,
                  autofocus: true,
                ),
              ),
              InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Icon(
                  Icons.arrow_upward,
                  color: Colors.blue,
                  size: 30,
                ),
                onTap: () {
                  todoBloc.addTodo(model: listModel);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
