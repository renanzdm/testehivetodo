import 'package:flutter_test/flutter_test.dart';

import 'package:teste_hive/app/pages/add_todo/add_todo_bloc.dart';

void main() {
  AddTodoBloc bloc;

  setUp(() {
    bloc = AddTodoBloc();
  });

  group('AddTodoBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<AddTodoBloc>());
    });
  });
}
