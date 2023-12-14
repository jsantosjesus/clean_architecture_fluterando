import 'package:bloc/bloc.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/usecase/search_by_text.dart';
import 'package:clean_architecture_fluterando/modules/search/presenter/search/states/state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchByText usecase;
  // final List<ResultSearch> _resultSearchList = [];
  // List<ResultSearch> get resultSearchList => _resultSearchList;
  SearchCubit(this.usecase) : super(SearchStateStart());

  Future<void> searchByText(String searchText) async {
    emit(SearchStateLoading());
    final result = await usecase(searchText);
    result.fold(
        (l) => emit(SearchStateError(l)), (r) => emit(SearchStateSuccess(r)));
  }
}
