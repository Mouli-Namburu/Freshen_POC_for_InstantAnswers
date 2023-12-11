
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitled/features/search/domain/search_use_case.dart';
import 'package:untitled/shared/data/network_result.dart';


class SearchState{
  final String searchQuery;
  final NetworkResult<String> searchResults;

  SearchState(this.searchQuery,this.searchResults);

  SearchState copyWith({String? searchQuery, NetworkResult<String>? searchResults}) {
    return SearchState(
      searchQuery ?? this.searchQuery,
      searchResults ?? this.searchResults,
    );
  }
}

class SearchProvider extends StateNotifier<SearchState> {

  final SearchUseCase _searchUseCase;

  SearchProvider(this._searchUseCase)
      : super(SearchState('', Success('')));

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  Future<void> search(String query) async {
    try {
      final results = await _searchUseCase.search(query);
      state = state.copyWith(searchResults: results);
    } catch (error) {
      print('Error: $error');
      state = state.copyWith(searchResults: Error("$error"));
    }
  }
}