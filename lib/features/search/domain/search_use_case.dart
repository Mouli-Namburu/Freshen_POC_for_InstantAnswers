import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitled/features/search/data/search_repository.dart';
import 'package:untitled/shared/data/network_result.dart';
import 'package:untitled/shared/dio_provider.dart';



class SearchUseCase {
   final ProviderRef<Object?> _ref;

   SearchUseCase(this._ref);

   Future<NetworkResult<String>> search (String query) async{
      final respository = SearchRepository(_ref.read(dioProvider));
      return respository.search(query);
   }

}