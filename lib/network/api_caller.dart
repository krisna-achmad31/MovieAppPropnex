import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'network_exception.dart';
import 'package:http/http.dart' as http;

class ApiCaller {
  final String _baseUrl = "https://api.themoviedb.org/3";

  String getBaseUrl() {
    return _baseUrl;
  }

  Future<dynamic> get(String url, Map<String, dynamic>? param) async {
    var responseJson;
    try {
      String queryString = Uri(queryParameters: param).query;
      final uri = Uri.parse("$_baseUrl/$url?$queryString");
      print(uri);
      final response = await http.get(uri);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    print('response result => ${response.body.toString()}');
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print('case 200 result => $responseJson');
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 402:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 500:

      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
