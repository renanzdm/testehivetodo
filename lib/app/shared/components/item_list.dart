import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_hive/app/pages/add_todo/add_todo_module.dart';
import 'package:teste_hive/app/pages/home/home_bloc.dart';
import 'package:teste_hive/app/pages/home/home_module.dart';
import 'package:teste_hive/app/shared/models/list_model.dart';

class ItemList extends StatefulWidget {
  final ListModel listModel;

  ItemList({this.listModel});

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  var bloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => AddTodoModule(widget.listModel)));
              },
              child: ListTile(
                leading: Icon(Icons.list,
                    color: Color(widget.listModel.color)),
                title: Text(
                  widget.listModel.title,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
