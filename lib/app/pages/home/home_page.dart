import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_hive/app/pages/home/home_module.dart';
import 'package:teste_hive/app/pages/lista_todos/lista_todos_page.dart';
import 'package:teste_hive/app/shared/components/app_bar_custom.dart';
import 'package:teste_hive/app/shared/components/bottom_app_bar.dart';
import 'package:teste_hive/app/shared/components/home_category.dart';

import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(
          height: 100,
        ),
        body: StreamBuilder<int>(
          stream: bloc.listPriority,
          builder: (context, snapshot) {
            return Column(
              children: <Widget>[
                HomeCategory(
                  color: Colors.yellow[700],
                  title: 'Meu Dia',
                  iconData: Icons.wb_sunny,
                  priority: snapshot.data,
                ),
                HomeCategory(
                  color: Colors.redAccent,
                  title: 'Importantes',
                  iconData: Icons.star_border,
                  priority: snapshot.data,
                ),
                HomeCategory(
                  color: Colors.green[600],
                  title: 'Planejados',
                  iconData: Icons.date_range,
                  priority: snapshot.data,
                ),
                HomeCategory(
                  color: Colors.purple[600],
                  title: 'Tarefas',
                  iconData: Icons.home,
                  priority: snapshot.data,
                ),
                Divider(thickness: 1,),
                Expanded(
                  child: ListTodosPage(),
                )
              ],
            );
          }
        ),
        
        bottomNavigationBar: BottomAppBarCustom(),
      ),
    );
  }
}
