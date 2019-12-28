import 'package:flutter/material.dart';
import 'package:teste_hive/app/pages/add_todo/add_todo_bloc.dart';
import 'package:teste_hive/app/pages/add_todo/add_todo_module.dart';
import 'package:teste_hive/app/shared/models/todo_model.dart';

class ItemTodo extends StatefulWidget {
  final TodoModel todoModel;


  const ItemTodo({this.todoModel});

  @override
  _ItemTodoState createState() => _ItemTodoState();
}

class _ItemTodoState extends State<ItemTodo> {
  bool star = false;

  AddTodoBloc bloc = AddTodoModule.to.getBloc();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Checkbox(
          onChanged: (bool value) {
            setState(() {
              widget.todoModel.check = value;
            });
          },
          value: widget.todoModel.check,
        ),
        title: Text(widget.todoModel.content),
        trailing: GestureDetector(
            onTap: () {
              setState(() {
                star = !star;
                widget.todoModel.priority = star; 
              });
            },
            child: widget.todoModel.priority
                ? Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                : Icon(Icons.star_border)),
      ),
    );
  }
}
