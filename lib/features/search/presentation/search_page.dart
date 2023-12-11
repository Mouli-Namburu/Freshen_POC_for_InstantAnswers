import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:untitled/features/search/presentation/search_view_model.dart';
import 'package:untitled/shared/data/network_result.dart';

import '../diProvider/provider.dart';




class SearchPage extends HookConsumerWidget{


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final searchQuery = ref.watch(searchQueryProvider);
    final searchResults = ref.watch(searchResultsProvider);
    final searchViewModel = ref.read(searchViewModelProvider);


   return Scaffold(
     appBar: AppBar(
       title: Text('Search Page'),
     ),
     body: Column(
       children: [
         SearchBox(
           searchQuery: searchQuery,
           onSearch:(query) => searchViewModel.search(query),
         ),
         _buildSearchContent(searchResults),
       ],
     ),
   );
  }

}

Widget _buildSearchContent(NetworkResult<String> result) {

  switch(result){
   case Loading() :{
     return CircularProgressIndicator();
  }
    case Success():{
      return SearchResults(searchResults: result.data!!);
    }
    case Error():{
      return Text(result.message ?? 'Error fetching data');
    }
    default:{
      return SizedBox.shrink();
    }
  }

}

class SearchBox extends StatelessWidget {

  final String searchQuery;
  final Function(String) onSearch;

  SearchBox({required this.searchQuery, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Enter your search query ends with ?' ,
        ),
        onSubmitted: onSearch,
        controller: TextEditingController(text:searchQuery),
      ),
    );
  }
}

class SearchResults extends StatelessWidget {
  final String searchResults;

  SearchResults({super.key, required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(searchResults)
    );
  }
}