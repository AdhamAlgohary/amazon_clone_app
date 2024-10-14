import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core_import_packages.dart';

class ApiHelper {
  static final http.Client client = http.Client();
  static const postRequestHeader = {"Content-Type": "application/json"};
  static Map<String, String> getRequestHeader({required String userToken}) {
    final Map<String, String> getRequestHeader = <String, String>{
      "Content-Type": "application/json",
      AppConstantText.keyForCachedUserToken: userToken
    };
    return getRequestHeader;
  }

  const ApiHelper();

  static Future<http.Response> postRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    final encodedBody = json.encode(body);

    return await client.post(
      Uri.parse(url),
      headers: postRequestHeader,
      body: encodedBody,
    );
  }

  static Future<http.Response> getRequest(
      {required String url, required String userToken}) async {
    return await client.get(Uri.parse(url),
        headers: getRequestHeader(userToken: userToken));
  }

  static T handleResponse<T>({
    required http.Response response,
    required T Function(Map<String, dynamic>) onSuccess,
  }) {
    final responseIsSuccess = response.statusCode == 200;

    if (responseIsSuccess) {

      Map<String, dynamic> decodedJson = json.decode(response.body);
      return onSuccess(decodedJson);
      
    } else if (response.statusCode == 400) {
      FailuresMsgs.clientFailureMsg =
          responseFromApi(json.decode(response.body));
      throw const ClientException();
    } else {
      FailuresMsgs.serverFailureMsg =
          responseFromApi(json.decode(response.body));
      throw const ServerException();
    }
  }

  static String responseFromApi(Map<String, dynamic> decodedJson) {
    final String responseFromApi = decodedJson["responseFromApi"];
    return responseFromApi;
  }
}
