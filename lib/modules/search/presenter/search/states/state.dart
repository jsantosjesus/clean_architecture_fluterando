import 'package:clean_architecture_fluterando/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/errors/errors.dart';

abstract class SearchState {}

class SearchStateStart implements SearchState {}

class SearchStateLoading implements SearchState {}

class SearchStateError implements SearchState {
  final FailureSearch error;

  SearchStateError(this.error);
}

class SearchStateSuccess implements SearchState {
  final List<ResultSearch> list;

  SearchStateSuccess(this.list);
}
