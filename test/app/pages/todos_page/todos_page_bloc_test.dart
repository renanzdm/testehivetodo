import 'package:flutter_test/flutter_test.dart';

import 'package:teste_hive/app/pages/todos_page/todos_page_bloc.dart';

void main() {
  TodosPageBloc bloc;

  setUp(() {
    bloc = TodosPageBloc();
  });

  group('TodosPageBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<TodosPageBloc>());
    });
  });
}
