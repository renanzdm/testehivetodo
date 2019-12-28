import 'package:teste_hive/app/app_module.dart';
import 'package:teste_hive/app/pages/home/home_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:teste_hive/app/pages/home/home_page.dart';
import 'package:teste_hive/app/shared/services/local_storage_service.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc(AppModule.to.getDependency<LocalStorageService>())),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
