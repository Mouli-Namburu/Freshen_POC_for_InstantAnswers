class NetworkResult<T>{
  final T? data;
  final String? message;

  NetworkResult({this.data,this.message});
}

class Success<T> extends NetworkResult<T>{
  Success(T data):super(data: data);
}

class Error<T> extends NetworkResult<T>{
  Error(String? message,{T? data}):super(data:data,message: message);
}

class Loading<T> extends NetworkResult<T>{
  Loading():super();
}