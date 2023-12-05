import 'package:clean_architecture_fluterando/modules/search/domain/usecase/search_by_text_impl.dart';
import 'package:clean_architecture_fluterando/modules/search/external/datasources/github_datasource.dart';
import 'package:clean_architecture_fluterando/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModular extends Module {
  @override
  void binds(i) {
    i.add(SearchByTextImpl(i()));
    i.add(GithubDatasource(i()) as Function);
    i.add(Dio() as Function);
    i.add(SearchRepositoryImpl.new);
  }

  @override
  void routes(r) {}
}
