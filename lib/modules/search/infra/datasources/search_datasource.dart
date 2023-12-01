import 'package:clean_architecture_fluterando/modules/search/domain/entities/result_search.dart';

abstract class SearchDatasource {
  Future<List<ResultSearch>> getSearch(String searchText);
}
