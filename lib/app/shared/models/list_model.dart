import 'package:teste_hive/app/shared/models/todo_model.dart';

class ListModel {
  int id;
  String title;
  int color;
  List<TodoModel> todos;

  ListModel({this.title, this.id, this.todos, this.color = 0xffA9A9A9});

  toJson() {
   var todosJason =  todos?.map((item)=>item.toJson())?.toList();
    return {'id': id, 'title': title, 'todos': todosJason, 'color': color};
  }

  factory ListModel.fromJson(Map json) {
    return ListModel(
        id: json['id'],
        title: json['title'],
        todos: TodoModel.fromJsonList(json['todos'] as List),
        color: json['color']);
  }
}
