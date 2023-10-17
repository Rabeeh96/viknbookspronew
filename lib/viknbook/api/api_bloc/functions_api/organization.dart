import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../Repository/api_client.dart';
import '../model/OrganizationListModelClass.dart';

class OrganizationApi {
  ApiClient apiClient = ApiClient();
  OrganizationListModelClass organizationListModelClass =
      OrganizationListModelClass();

  Future<OrganizationListModelClass> OrganizationListFunction(
      {required int userId, required bool is_mobile}) async {
    const String path = "users/companies/";
    final body = {"userId": userId, "is_mobile": is_mobile};

    Response response =
        await apiClient.invokeAPI(path: path, method: "POST", body: body);

    log("_________________ list loan  in api  $body");
    return OrganizationListModelClass.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
  }
}
