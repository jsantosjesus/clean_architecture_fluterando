import 'package:bloc/bloc.dart';
import 'package:clean_architecture_fluterando/modules/search/domain/usecase/search_by_text.dart';
import 'package:clean_architecture_fluterando/modules/search/presenter/search/states/state.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class SearchCubit extends Cubit<SearchState> {
  final SearchByText usecase;
  final _searchSubject = BehaviorSubject<String>();
  late final StreamSubscription _searchSubscription;

  SearchCubit(this.usecase) : super(SearchStateStart()) {
    _searchSubscription = _searchSubject
        .debounceTime(Duration(milliseconds: 800))
        .listen((searchText) {
      _performSearch(searchText);
    });
  }

  Future<void> searchByText(String searchText) async {
    _searchSubject.add(searchText);
  }

  Future<void> _performSearch(String searchText) async {
    emit(SearchStateLoading());
    if (searchText.isEmpty) {
      emit(SearchStateStart());
    } else {
      final result = await usecase(searchText);
      result.fold(
        (l) => emit(SearchStateError(l)),
        (r) => emit(SearchStateSuccess(r)),
      );
    }
  }

  @override
  Future<void> close() {
    _searchSubscription.cancel();
    _searchSubject.close();
    return super.close();
  }
}
