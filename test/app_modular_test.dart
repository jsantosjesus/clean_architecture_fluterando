import 'dart:convert';

import 'package:clean_architecture_fluterando/app_modular.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/usecase/search_by_text.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/usecase/search_by_text_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'modules/search/mock/result_search_datasource_mock.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  Modular.bindModule(AppModular());

  test('should retrieve the usecase without error', () {
    final usecase = Modular.get<SearchByText>();

    expect(usecase, isA<SearchByTextImpl>());
  });

  test('should return a resultSearch list', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        data: jsonDecode(dataMock),
        statusCode: 200,
        requestOptions: RequestOptions()));

    final usecase = Modular.get<SearchByText>();

    final result = await usecase('jsantosjesus');

    expect(result.fold((l) => l, (r) => r), isA<List<ResultSearch>>());
  });
}
