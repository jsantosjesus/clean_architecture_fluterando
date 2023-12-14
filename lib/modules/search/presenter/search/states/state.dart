import 'package:clean_architecture_fluterando/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/errors/errors.dart';

abstract class SearchState {}

class SearchStateStart extends SearchState {}

class SearchStateLoading extends SearchState {}

class SearchStateError extends SearchState {
  final FailureSearch error;

  SearchStateError(this.error);
}

class SearchStateSuccess extends SearchState {
  final List<ResultSearch> list;

  SearchStateSuccess(this.list);
}
