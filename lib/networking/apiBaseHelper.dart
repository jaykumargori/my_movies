import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'appExceptions.dart';

class ApiBaseHelper {
  final String _baseUrl = "https://api.themoviedb.org/3/";

  Future<dynamic> get(String url) async {
    print("api get url $url");

    var responseJson;

    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      responseJson = _returnResponse(response);
    } on SocketException {
      print("No Net");
      throw FetchDataException('No Internet Connection');
    }
    print("api get recieved");
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

      case 403:
        throw UnauthorisedException(response.body.toString());

      default:
        throw FetchDataException(
            'error occured while communication with statuscode: ${response.statusCode}');
    }
  }
}
