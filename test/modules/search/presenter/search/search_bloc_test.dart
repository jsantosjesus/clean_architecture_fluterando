import 'package:clean_architecture_fluterando/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/usecase/search_by_text.dart';
import 'package:clean_architecture_fluterando/modules/search/presenter/search/search_bloc.dart';
import 'package:clean_architecture_fluterando/modules/search/presenter/search/states/state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchByTextMock extends Mock implements SearchByText {}

void main() {
  final usecase = SearchByTextMock();
  final bloc = SearchBloc(usecase);

  test('must return the states in the correct form', () {
    when(() => usecase.call(any()))
        .thenAnswer((_) async => const Right(<ResultSearch>[]));

    expect(
        bloc,
        emitsInOrder([
          isA<SearchStateLoading>(),
          isA<SearchStateSuccess>(),
        ]));

    bloc.add("jsantojesus");
  });
}
