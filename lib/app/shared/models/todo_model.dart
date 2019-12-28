class TodoModel {
  int id;
  String content;
  bool check;
  bool priority;

  TodoModel({this.id, this.content = '', this.check = false, this.priority = false});

  toJson() {
    return {
      'id': id,
      'content': content,
      'check': check,
      'priority': priority
    };
  }

  factory TodoModel.fromJson(Map json) {
    if (json == null) return null;
    return TodoModel(
        id: json['id'], content: json['content'], check: json['check'], priority: json['priority']);
  }

  static List<TodoModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => TodoModel.fromJson(item)).toList();
  }
}
