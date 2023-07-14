class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'No Internet');
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, 'Request TIme out');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Server Error');
}

class InvalidURL extends AppException {
  InvalidURL([String? message]) : super(message, 'Invalid URL');
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error While Communication');
}
