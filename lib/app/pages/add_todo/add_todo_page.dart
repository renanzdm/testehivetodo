import 'package:flutter/material.dart';
import 'package:teste_hive/app/pages/home/home_bloc.dart';
import 'package:teste_hive/app/pages/home/home_module.dart';
import 'package:teste_hive/app/shared/components/dialog_add_todo.dart';
import 'package:teste_hive/app/shared/components/item_todo.dart';
import 'package:teste_hive/app/shared/models/list_model.dart';

class AddTodoPage extends StatefulWidget {
  final ListModel listModel;

  const AddTodoPage({Key key, this.listModel}) : super(key: key);

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  HomeBloc homeBloc = HomeModule.to.getBloc();

  Future<bool> _onWillPop() async {
    await homeBloc.updateTodo(widget.listModel);
   
    return true;
    }

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            )
          ],
          elevation: 0,
          backgroundColor: Color(widget.listModel.color),
          title: Text("${widget.listModel.title}"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AddTodoDialog(
                      listModel: widget.listModel,
                    ),
                barrierDismissible: false);
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          width: sizes.width,
          color: Color(widget.listModel.color),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: widget.listModel.todos == null
                      ? []
                      : widget.listModel.todos.map((todo) {
                          return ItemTodo(
                            todoModel: todo,
                          );
                        }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
