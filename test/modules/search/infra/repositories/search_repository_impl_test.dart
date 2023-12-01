import 'package:clean_architecture_fluterando/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_fluterando/modules/search/infra/datasources/search_datasource.dart';
import 'package:clean_architecture_fluterando/modules/search/infra/models/result_search_model.dart';
import 'package:clean_architecture_fluterando/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchDataSourceMock extends Mock implements SearchDatasource {}

void main() {
  final datasource = SearchDataSourceMock();
  final repository = SearchRepositoryImpl(datasource: datasource);

  test('shold return a resultSearch list', () async {
    //Arrange
    when(() => datasource.getSearch(any()))
        .thenAnswer((_) async => <ResultSearchModel>[]);

    //Act
    final result = await repository.search('teste');

    //Assert
    expect(result.fold((l) => l, (r) => r), isA<List<ResultSearch>>());
  });

  test('shold return a DatasourceError if the datasource fails', () async {
    //Arrange
    when(() => datasource.getSearch(any())).thenThrow(Exception());

    //Act
    final result = await repository.search('teste');

    //Assert
    expect(result.fold((l) => l, (r) => r), isA<DatasourceError>());
  });
}
