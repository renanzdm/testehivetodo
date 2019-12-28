import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  AppBarCustom({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 16),
        decoration:
            BoxDecoration(border: Border(bottom: BorderSide(width: 0.2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(),
            ),
            Text('Renanzdm@gmail.com'),
            Spacer(),
          ],
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
