import 'package:flutter_test/flutter_test.dart';

import 'package:teste_hive/app/pages/lista_todos/lista_todos_bloc.dart';

void main() {
  ListaTodosBloc bloc;

  setUp(() {
    bloc = ListaTodosBloc();
  });

  group('ListaTodosBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<ListaTodosBloc>());
    });
  });
}
