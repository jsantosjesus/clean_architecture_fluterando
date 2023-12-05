import 'package:clean_architecture_fluterando/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_fluterando/modules/search/infra/datasources/search_datasource.dart';
import 'package:clean_architecture_fluterando/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';

extension on String {
  normalize() {
    return this.replaceAll(" ", "+");
  }
}

class GithubDatasource implements SearchDatasource {
  final Dio dio;

  GithubDatasource(this.dio);
  @override
  Future<List<ResultSearch>> getSearch(String searchText) async {
    final response = await dio
        .get('https://api.github.com/search/users?q=${searchText.normalize()}');

    if (response.statusCode == 200 && response.data != null) {
      final list = (response.data["items"] as List)
          .map((e) => ResultSearchModel.fromMap(e))
          .toList();

      return list;
    } else {
      throw DatasourceError();
    }
  }
}
