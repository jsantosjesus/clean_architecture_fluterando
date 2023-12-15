import 'package:clean_architecture_fluterando/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/usecase/search_by_text.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/usecase/search_by_text_impl.dart';
import 'package:clean_architecture_fluterando/modules/search/external/datasources/github_datasource.dart';
import 'package:clean_architecture_fluterando/modules/search/infra/datasources/search_datasource.dart';
import 'package:clean_architecture_fluterando/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:clean_architecture_fluterando/modules/search/presenter/search/search_cubit.dart';
import 'package:clean_architecture_fluterando/modules/search/presenter/search/search_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModular extends Module {
  @override
  void binds(i) {
    i.add<SearchByText>(SearchByTextImpl.new);
    i.add<SearchDatasource>(GithubDatasource.new);
    i.addInstance<Dio>(Dio());
    i.add<SearchRepository>(SearchRepositoryImpl.new);
    i.add<SearchCubit>(SearchCubit.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SearchPage());
  }
}
