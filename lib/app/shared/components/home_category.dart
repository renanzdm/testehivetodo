import 'package:flutter/material.dart';
import 'package:teste_hive/app/shared/models/todo_model.dart';

class HomeCategory extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final String title;
  final int priority;

  HomeCategory({this.color, this.title, this.iconData, this.priority});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          trailing: Text(priority.toString()),
          leading: Icon(
            iconData,
            color: color,
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
