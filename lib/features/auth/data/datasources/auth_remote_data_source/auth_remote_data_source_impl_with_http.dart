import 'dart:async';
import 'dart:convert';
import 'package:amazon_clone_app/core/error/exception.dart';
import 'package:amazon_clone_app/core/strings/end_points/auth_end_points.dart';
import 'package:amazon_clone_app/core/strings/failures_msg.dart';
import 'package:amazon_clone_app/features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:amazon_clone_app/features/auth/data/models/user.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSourceImplWithHttp implements AuthRemoteDataSource {
  final http.Client client;
  static const headers = {"Content-Type": "application/json"};
  const AuthRemoteDataSourceImplWithHttp({required this.client});

  @override
  Future<User> signIn(User user) async {
    final String body =
        _encodedBody({"email": user.email, "password": user.password});
    final response =
        await _postRequest(url: AuthEndPoints.signInEndPoint, body: body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = json.decode(response.body);
      User userData = User.fromJson(decodedJson);
      return userData;
    } else {
      throw _handleErrorResponse(response: response);
    }
  }

  @override
  Future<String> signUpNewUser(User user) async {
    final String body = _encodedBody(
        {"name": user.name, "email": user.email, "password": user.password});
    final response =
         _postRequest(url: AuthEndPoints.signUpEndPoint, body: body);

    if (response.statusCode == 200) {
      return _msgFromApi(response.body);
    } else {
      throw _handleErrorResponse(response: response);
    }
  }

  String _encodedBody(Map<String, dynamic> body) {
    final String encodedBody = json.encode(body);
    return encodedBody;
  }

  Future<http.Response> _postRequest(
      {required String url, required String body}) async {
    final response =
        await client.post(Uri.parse(url), headers: headers, body: body);
    return response;
  }

  Exception _handleErrorResponse({required http.Response response}) {
    final errMsg = _msgFromApi(response.body);
    if (response.statusCode == 400) {
      FailuresMsg.clientFailureMsg = errMsg;
      return const ClientException();
    } else {
      FailuresMsg.serverFailureMsg = errMsg;
      return const ServerException();
    }
  }

  String _msgFromApi(String responseBody) {
    final decodedJson = json.decode(responseBody);
    final String successOrFailedMsgFromApi = decodedJson["msgFromApi"];
    return successOrFailedMsgFromApi;
  }
}
