import 'package:clean_architecture_fluterando/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/usecase/search_by_text.dart';
import 'package:clean_architecture_fluterando/modules/search/presenter/search/search_cubit.dart';
import 'package:clean_architecture_fluterando/modules/search/presenter/search/states/state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchByTextMock extends Mock implements SearchByText {}

void main() {
  final usecase = SearchByTextMock();
  final cubit = SearchCubit(usecase);
  const searchText = "jsantosjesus";

  test('must return the states in the correct form', () async {
    when(() => usecase.call(any()))
        .thenAnswer((_) async => const Right(<ResultSearch>[]));

    expectLater(
        cubit.stream,
        emitsInOrder([
          isA<SearchStateLoading>(),
          isA<SearchStateSuccess>(),
        ]));
    await cubit.searchByText(searchText);
  });

  test('shold to return error state after loading state', () async {
    when(() => usecase.call(any()))
        .thenAnswer((_) async => Left(InvalidTextError()));

    expectLater(
        cubit.stream,
        emitsInOrder([
          isA<SearchStateLoading>(),
          isA<SearchStateError>(),
        ]));
    await cubit.searchByText(searchText);
  });
  test('shold to return a start state', () async {
    when(() => usecase.call(any()))
        .thenAnswer((_) async => Left(InvalidTextError()));

    expectLater(
        cubit.stream,
        emitsInOrder([
          isA<SearchStateLoading>(),
          isA<SearchStateStart>(),
        ]));
    await cubit.searchByText("");
  });
}
