import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitled/features/search/domain/search_use_case.dart';
import 'package:untitled/features/search/injection/injection_provider.dart';
import 'package:untitled/shared/data/network_result.dart';


class SearchProvider extends ChangeNotifier {
  final ChangeNotifierProviderRef<Object?> _ref;
  final SearchUseCase _searchUseCase;

  SearchProvider(this._ref) : _searchUseCase = _ref.read(searchUseCaseProvider);

  String _searchQuery = '';
  NetworkResult<String> _searchResults = Success("");

  String get searchQuery => _searchQuery;
  NetworkResult<String> get searchResults => _searchResults;

  set searchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> search(query) async {
    try {
      _searchResults = await _searchUseCase.search(query);
    } catch (error) {
      print('Error: $error');
    }

    notifyListeners();
  }
}