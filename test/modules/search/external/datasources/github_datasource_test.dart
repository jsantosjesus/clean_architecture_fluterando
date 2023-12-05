import 'dart:convert';

import 'package:clean_architecture_fluterando/modules/search/external/datasources/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/result_search_datasource_mock.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = GithubDatasource(dio);

  test('shold return a resultSearchModel list',

      //Arrange
      () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        data: jsonDecode(dataMock),
        statusCode: 200,
        requestOptions: RequestOptions()));

    //Act
    final future = await datasource.getSearch('felipe moura');
    //Assert
    expect(future, completes);
  });
}
