import 'dart:convert';

import 'package:clean_architecture_fluterando/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_fluterando/modules/search/external/datasources/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/result_search_datasource_mock.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = GithubDatasource(dio);
  //happy test
  test('shold return a resultSearchModel list',

      //Arrange
      () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        data: jsonDecode(dataMock),
        statusCode: 200,
        requestOptions: RequestOptions()));

    //Act
    final future = datasource.getSearch('jsantosjesus');
    //Assert
    expect(future, completes);
  });

  // test statusCode error
  test('shold return a DatasourceError if the code is not 200',

      //Arrange
      () async {
    when(() => dio.get(any())).thenAnswer((_) async =>
        Response(statusCode: 401, requestOptions: RequestOptions()));

    //Act
    final future = datasource.getSearch('jsantosjesus');
    //Assert
    expect(future, throwsA(isA<DatasourceError>()));
  });

  //test reponse error
  test('shold return a DatasourceError if response,data is null',

      //Arrange
      () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        data: null, statusCode: 200, requestOptions: RequestOptions()));

    //Act
    final future = datasource.getSearch('jsantosjesus');
    //Assert
    expect(future, throwsA(isA<DatasourceError>()));
  });
}
