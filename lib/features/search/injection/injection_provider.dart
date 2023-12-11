

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/data/network_result.dart';
import '../domain/search_use_case.dart';
import '../providers/search_provider.dart';


final searchViewModelProvider = ChangeNotifierProvider((ref) => SearchProvider(ref));

final searchQueryProvider = Provider<String>((ref) => ref.watch(searchViewModelProvider).searchQuery);

final searchResultsProvider = Provider<NetworkResult<String>>((ref) => ref.watch(searchViewModelProvider).searchResults);

final searchUseCaseProvider = Provider((ref) => SearchUseCase(ref));