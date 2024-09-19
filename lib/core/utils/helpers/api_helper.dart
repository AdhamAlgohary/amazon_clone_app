import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/failures_msgs.dart';
import '../../error/exception.dart';

class ApiHelper {
  static final http.Client client = http.Client();
  static const headers = {"Content-Type": "application/json"};

  const ApiHelper();

  static Future<http.Response> postRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    final encodedBody = json.encode(body);
    return await client.post(
      Uri.parse(url),
      headers: headers,
      body: encodedBody,
    );
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
      FailuresMsgs.clientFailureMsg = msgFromApi(json.decode(response.body));
      throw const ClientException();
    } else {
      FailuresMsgs.serverFailureMsg = msgFromApi(json.decode(response.body));
      throw const ServerException();
    }
  }

 static String msgFromApi(Map<String, dynamic> decodedJson) {
    final String successOrFailedMsgFromApi = decodedJson["msgFromApi"];
    return successOrFailedMsgFromApi;
  }

}
