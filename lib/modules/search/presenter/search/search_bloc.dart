import 'package:bloc/bloc.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/usecase/search_by_text.dart';
import 'package:clean_architecture_fluterando/modules/search/presenter/search/states/state.dart';

// class SeachBloc extends Bloc<String, SearchState> {
//   final SearchByText usease;

//   SearchBloc(this.usecase) : super(SearchStateStart());

//   Stream<SearchState> mapEventToState(String searchText) async* {
//     yield SearchStateLoading();
//     final result = await usecase(searchText);
//     yield result.fold((l) => SearchStateError(l), (r) => SearchStateSuccess(r));
//   }
// }

class SearchBloc extends Bloc<String, SearchState> {
  final SearchByText usecase;

  SearchBloc(this.usecase) : super(SearchStateStart()) {
    on<String>(_onGetProducts);
  }

  _onGetProducts(String event, Emitter<SearchState> emit) async {
    emit(SearchStateLoading());
    var result = await usecase('');
    result.fold(
        (l) => emit(SearchStateError(l)), (r) => emit(SearchStateSuccess(r)));
  }
}
