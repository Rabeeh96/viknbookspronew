import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';



class MultiPartFileApiClientProfile {
  //static const String basePath ="http://192.168.1.72:8000/api/v1/";
  static const String basePath = 'https://www.api.zinco.vikncodes.com/api/v1/';


  Future<http.Response> invokeApi({
    required  String? filepath,
    required String path,
    required String method,
    String? firstName,
    String? userName,
    String? email,
    String? passwordOne,
    String? passwordTwo,
    String? phone,
    String? userTypeId,
    String? organization_id,

    required Map<String, String>? body,
    bool isFiles = true,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final jwt = prefs.getString('token');
    Map<String, String> headerParams = {
      "authorization": "Bearer $jwt",
      "content-type": "multipart/form-data"};
    print("111111111111111111111111111111111111111111111111111111111");
    print(basePath + path);
    print("22222222222222222222222222222222222222222222222222");
    var request = http.MultipartRequest(method, Uri.parse(basePath + path));
    print("3333333333333333333333333333333333333333333333333333333");
    request.headers.addAll(headerParams);
    print(basePath + path);
    print("request : $basePath$path");
    request.files.add(await http.MultipartFile.fromPath('Photo', filepath!));
    // request.fields.addAll(
    //     {
    //       "username":userName!,
    //       "email":email!,
    //       "password1":passwordOne!,
    //       "password2":passwordTwo!,
    //       "phone":phone!,
    //       "user_type_id":userTypeId!,
    //       "first_name":firstName!,
    //       "organization_id":organization_id!
    //
    //     });
    print(body);
    print("111111111111111111111111111111111111111111111111111111111");
    body != null ? request.fields.addAll(body) : null;
    print(request);

    http.StreamedResponse res = await request.send();
    print(res);
    http.Response responsed = await http.Response.fromStream(res);
    print(responsed);
    print(responsed.body);
    final responseData = json.decode(responsed.body);

    print('worked 4');
    if (res.statusCode == 200) {
      print(responseData);
    } else {
      print('Error');
    }
    print("reason : $res.");
    print(responsed);
    return responsed;
  }
}
