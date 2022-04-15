enum ResponseStatus{
  success,
  noInternet,
  reAuthenticate,
  unknown,
  failed,
}

extension ParseToString on ResponseStatus {
  String message(){
    switch(this){
      case ResponseStatus.success:
        return 'Success';
      case ResponseStatus.noInternet:
        return 'no internet';
      case ResponseStatus.reAuthenticate:
        return 'you need to re-login';
      case ResponseStatus.unknown:
        return 'unknown';
      case ResponseStatus.failed:
       return 'failed';
    }
  }
}

class HttpResponse<T> {
  ResponseStatus responseStatus;
  T? data;

  HttpResponse({
    required this.responseStatus,
    this.data,
  });
}
