import 'package:flutter/material.dart';
import 'package:teste_hive/app/shared/components/dialog_add_list.dart';

class BottomAppBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AddListDialog());
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.add, color: Colors.blueAccent),
                  Text(
                    'Nova Lista',
                    style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.playlist_add,
                color: Colors.blueAccent,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
