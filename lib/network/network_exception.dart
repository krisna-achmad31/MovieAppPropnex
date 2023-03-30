class NetworkException implements Exception {
  final message;
  final _prefix;

  NetworkException([this.message, this._prefix]);

  String toString() {
    return "$_prefix$message";
  }
}

class FetchDataException extends NetworkException {
  FetchDataException([String? message]) : super(message, "Error During Communication: ");
}

class BadRequestException extends NetworkException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class NotFoundException extends NetworkException {
  NotFoundException([message]) : super(message, "Not found: ");
}

class InvalidInputException extends NetworkException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}