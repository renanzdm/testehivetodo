import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_hive/app/pages/home/home_bloc.dart';
import 'package:teste_hive/app/pages/home/home_module.dart';
import 'package:teste_hive/app/shared/models/list_model.dart';

class AddListDialog extends StatelessWidget {
 final List _colors = <Color>[
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.blueGrey,
    Colors.lightBlue,
    Colors.orange,
    Colors.blueAccent,
    Colors.deepPurple,
    Colors.indigo,
    Colors.tealAccent

    
  ];

  @override
  Widget build(BuildContext context) {
    var bloc = HomeModule.to.getBloc<HomeBloc>();
    var sizes = MediaQuery.of(context).size;
    ListModel model = ListModel();

    return AlertDialog(
      actions: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                model.title = bloc.textEditingController.text;
                bloc.addList(model);
                bloc.textEditingController.clear();
                Navigator.pop(context);
              },
              child: Text('Criar Lista'),
            ),
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.red),
                )),
          ],
        )
      ],
      title: Text('Nova Lista'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.white,
      content: Container(
        height: sizes.height * 0.2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.playlist_add_check,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: bloc.textEditingController,
                    decoration: InputDecoration(labelText: 'Título da Lista'),
                  ),
                )
              ],
            ),
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _colors.map(
                  (cor) {
                    return InkWell(
                      onTap: () {
                       model.color = cor.value;
                        //print(model.toJson());
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 4),
                        height: 40,
                        width: 40,
                        decoration:
                            BoxDecoration(color: cor, shape: BoxShape.circle),
                      ),
                    );
                  },
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
