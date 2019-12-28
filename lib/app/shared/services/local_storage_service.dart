import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:teste_hive/app/shared/models/list_model.dart';

class LocalStorageService extends Disposable {
  Completer<Box> c = Completer<Box>();
  LocalStorageService() {
    _initDb();
    print('iniciou');
  }

  _initDb() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    final box = await Hive.openBox('todo');
    if (!c.isCompleted) c.complete(box);
  }

  Future<List<ListModel>> getAll() async {
    final box = await c.future;
   // print(box.values);
    return box.values.map((item) => ListModel.fromJson(item)).toList();
  }

  Future<ListModel> addList(ListModel model) async {
    final box = await c.future;
    var key = (box.values.length + 1);
    model.id = key;
    await box.put(key, model.toJson());
    return model;
  }

  remove(int id) async {
    final box = await c.future;
    await box.delete(id);
  }

  updateList(ListModel model) async {
    final box = await c.future;
    var key = model.id;
    await box.put(key, model.toJson());
  }

  @override
  void dispose() async {
    final box = await c.future;
    box.close();
  }
}
