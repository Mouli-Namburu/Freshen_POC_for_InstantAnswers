

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:untitled/shared/data/network_result.dart';
import 'package:untitled/shared/data/network_utilies.dart';

class SearchRepository{
  final Dio _dio;
  
  SearchRepository(this._dio);
  
  Future<NetworkResult<String>> search(String query) async{
    try{
      print(query);
      // if condition is testing purpose
      if(query ==  "Highspot ?"){
        return Success("highspot is a sales enable platfrom");
      }else{
        final response = await _dio.get('https://app.latest.highspot.com/api/v1/search/qa?q=&query');
        //'https://postman-echo.com/get?test=$query'
        return await HttpResponseParser().parseHttpResponse(response, (jsonBody) {
         return jsonBody.data!!;
        });
      }
    }catch(error){
      print('Error:$error');
      return Error("Something Went Wrong");
    }
  }

  
}