import 'package:clean_architecture_fluterando/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/usecase/search_by_text_impl.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/usecase/search_by_text.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  late SearchRepositoryMock repository;
  late SearchByText usecase;

  setUp(() {
    repository = SearchRepositoryMock();
    usecase = SearchByTextImpl(repository);
  });

  test('should return a list of ResultSearch', () async {
    // Arrange
    when(() => repository.search(any()))
        .thenAnswer((_) async => const Right(<ResultSearch>[]));

    // Act
    final result = await usecase('teste');

    // Assert
    // expect(result, isA<Right<FailureSearch, List<ResultSearch>>>());
    expect(result.fold(id, id), isA<List<ResultSearch>>());
  });

  test('should return a exception when send a invalid text', () async {
    // Arrange
    when(() => repository.search(any()))
        .thenAnswer((_) async => const Right(<ResultSearch>[]));

    // Act
    final result = await usecase('');

    // Assert
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
