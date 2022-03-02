class HttpResponse<T> {
  bool status;
  String message;
  T data;

  HttpResponse({
    required this.data,
    required this.message,
    required this.status,
  });
}
