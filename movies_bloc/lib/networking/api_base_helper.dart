import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api_exception.dart';

class ApiBaseHelper {
  final String _baseUrl = 'https://api.themoviedb.org/3/';

  Future<dynamic> get(String url) async {
    print('Api get, url $url');
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get received!');
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());

      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}
