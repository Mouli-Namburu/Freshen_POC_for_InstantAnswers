import 'package:dio/dio.dart';

import 'network_result.dart';

class HttpResponseParser {

   Future<NetworkResult<T>> parseHttpResponse<T>(
      Response<dynamic> response, T Function(NetworkResult<T>) mapper) async {
    final statusCode = response.statusCode;

    if (statusCode! >= 200 && statusCode < 300) {
      // Successful response (status code 2xx)
      try {
        print(response.data);
        return Success(response.data);
      } catch (e) {
        return Error('Error parsing response data');
      }
    } else if (statusCode == 404) {
      // Resource not found
      return Error('Resource not found');
    } else {
      // Any other HTTP status code
      return Error('Error with status code: $statusCode');
    }
  }
}