import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_exception.dart';


//
class ApiClient {
  /// test
 // static const String basePath = 'http://192.168.1.68:8004/api/v1/';
 // static const String imageBasePath = 'http://192.168.1.68:8004';

   /// server
   static const String basePath = 'https://www.api.viknbooks.com/api/v10/';


   Future<Response> invokeAPI(
      {required String path,
        required String method,
        required Object? body}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    ///final token = prefs.getString('token');
    final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI3NTgzNTY5LCJpYXQiOjE2OTYwNDc1NjksImp0aSI6IjYzNDEyMjk2Nzk5ZTRmNjdiYTc2N2Q5Nzg0YzIzMWZkIiwidXNlcl9pZCI6MzcxfQ.q8KdnZcBbYrelI35j9IsYsYkzC-deJSiNLPTFaFqnAQt4r_4MkoBcEVsiQOApXbrlwoY_tT_UoxL5wo78z04nVaAflEx0BRQ008WwtVEZnSGLgQqJx-v1WhWiIeEskPYNGm7wRAzB5e82pxZPIUwwNqb4Mdfdf4fbqxE9McFVKEQ3xRzH58BZTAtQ20IWEhdbUdqPyXXl8qmz0UJ287vc2ZqFPJqDpY0Uee5Sw6tlFHHc7DAY_kDTrvo7sJDDaqY1cfwPEFfVtSOLxXQe9B1W3WOpc_D3iJVGlYZEM_sz4oJ6ZLrKpwvxz5nMyuGK8J_hQEkTYGSgIWiWb5bvlq_MvE1bzlIrQDGuLZREsPilMTeiUxqy9LS35lOXi_q8Wr24cMaCPMcTxgGOXBswXw2NaaWpE7NGSYdhMvdCZ7MR5Wch9fD1521IpLChZgfU00CV5HFNowvJncn-PE2KLdeuke3dwypTJCLKMbaAq6eQrb90N5nCfzlxjTukuk3uANjZ9zuIBdUA4C7nPhpaUkqrPOqNRJJMhx0O1qC7v-hkuW05uG5LohaO-1lJpIjn-RiWFAmlxM6qogMze806tFIilWJZj-XIPdLc3Hqj6D0bbNBUW5rET4B0DLfkdYe0EXNhVLeLxx4zL29P3tqIJDdWWDhgd9dubNg0JrfNJFCyCk";

    Map<String, String> headerParams = {};
    if (method == 'POST' || method == 'GET' || method == 'PATCH'|| method =="DELETE" ) {
      print("Methode POST OR GET");
      headerParams = {
        "authorization": "Bearer $token",
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
    }
    //
    else if(method == "POST_" ){

      headerParams = {
        "authorization": "Bearer $token",
      };

    }
    // x
    Response response;

    String url = basePath + path;

    // String searchurl =  basePath + 'search/movie'+'?api_key=$token'+ path;



    // print(searchurl);
    final nullableHeaderParams = (headerParams.isEmpty) ? null : headerParams;

    switch (method) {
      case "POST":
        response = await post(Uri.parse(url),
            headers: headerParams, body: jsonEncode(body));
        break;
      case "LOGIN":
        response =
        await post(Uri.parse(url), headers: headerParams, body: body);
        break;
      case "PUT":
        response = await put(Uri.parse(url), headers: headerParams, body: jsonEncode(body));
        break;
      case "PATCH":
        response = await patch(Uri.parse(url),
            headers: headerParams, body: jsonEncode(body));
        break;
      case "DELETE":
        response = await delete(Uri.parse(url), headers: headerParams,body: jsonEncode(body));
        break;
      case "DELETE_":
        response = await delete(Uri.parse(url), headers: headerParams,body: jsonEncode(body));
        break;
      case "POST_":
        response = await post(
          Uri.parse(url),
          headers: headerParams,
          body: body,
        );
        break;
      case "GET_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;

      default:
        response = await get(Uri.parse(url), headers: headerParams);
    }
    log("**************${response.body}");

    print('status of $path =>' + (response.statusCode).toString());
    print(response.body);
    if (response.statusCode >= 400) {
      log(path +
          ' : ' +
          response.statusCode.toString() +
          ' : ' +
          response.body);

      throw ApiException(
          message: _decodeBodyBytes(response), statusCode: response.statusCode);
    }
    return response;
  }

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers['content-type'];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'];
    } else {
      return response.body;
    }
  }
}