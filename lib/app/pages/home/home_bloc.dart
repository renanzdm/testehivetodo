import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teste_hive/app/shared/models/list_model.dart';
import 'package:teste_hive/app/shared/services/local_storage_service.dart';

class HomeBloc extends BlocBase {
  final LocalStorageService _localStorageService;
  TextEditingController textEditingController = TextEditingController();
  List<ListModel> list;
  int countPriority = 0;

  HomeBloc(this._localStorageService);

  var _listTodoController = BehaviorSubject<List<ListModel>>.seeded([]);

  var _listPriority = BehaviorSubject<int>();

  Stream<List<ListModel>> get listFlux => _listTodoController.stream;
  Stream<int> get listPriority => _listPriority.stream;

 

  addList(ListModel model) async {
    await _localStorageService.addList(model);
    getList();
  }

  getList() async {
    list = await _localStorageService.getAll();
    _listTodoController.add(list);
  }

  removeTodo(int id) async {
    _localStorageService.remove(id);
    list = await _localStorageService.getAll();
    _listTodoController.add(list);
  }

  updateTodo(ListModel model) async {
    await _localStorageService.updateList(model);
  }

  @override
  void dispose() {
    _listTodoController.close();
    _listPriority.close();
    super.dispose();
  }
}
