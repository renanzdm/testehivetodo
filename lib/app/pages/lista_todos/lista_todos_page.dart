import 'package:flutter/material.dart';
import 'package:teste_hive/app/pages/home/home_bloc.dart';
import 'package:teste_hive/app/pages/home/home_module.dart';
import 'package:teste_hive/app/shared/components/item_list.dart';
import 'package:teste_hive/app/shared/models/list_model.dart';

class ListTodosPage extends StatefulWidget {
  @override
  _ListTodosPageState createState() => _ListTodosPageState();
}

class _ListTodosPageState extends State<ListTodosPage> {
  var bloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  void initState() {
    bloc.getList();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder<List<ListModel>>(
          initialData: [],
          stream: bloc.listFlux,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemList(
                  listModel: snapshot.data[index],
                );
              },
            );
          }),
    );
  }
}