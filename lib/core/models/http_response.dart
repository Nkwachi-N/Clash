enum Status{
  success,
  noInternet,
  reAuthenticate,
  unknown,
  failed,
  rateExceeded
}

extension ParseToString on Status {
  String message(){
    switch(this){
      case Status.success:
        return 'Success';
      case Status.noInternet:
        return 'No internet';
      case Status.reAuthenticate:
        return 'You need to re-login';
      case Status.unknown:
        return 'unknown';
      case Status.failed:
       return 'failed';
      case Status.rateExceeded:
        return 'Rate exceeded';
    }
  }
}

class HttpResponse<T> {
  Status status;
  T? data;

  HttpResponse({
    required this.status,
    this.data,
  });
}
