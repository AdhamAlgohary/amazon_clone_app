import 'package:amazon_clone_app/core/constants/api_path.dart';
import 'package:amazon_clone_app/core/constants/failures_msgs.dart';
import 'package:amazon_clone_app/core/error/exception.dart';
import 'package:amazon_clone_app/features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:amazon_clone_app/features/auth/data/models/user.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRemoteDataSourceImplWithHttp implements AuthRemoteDataSource {
  final http.Client client;
  static const headers = {"Content-Type": "application/json"};

  const AuthRemoteDataSourceImplWithHttp({required this.client});

  @override
  Future<User> signIn({required String email, required String password}) async {
    final body = {"email": email, "password": password};
    final response =
        await client.post(Uri.parse(ApiPath.signInEndPoint), body: body);
    final responseIsRightCondition = response.statusCode == 200;

    if (responseIsRightCondition) {
      final Map<String, dynamic> decodedJson = json.decode(response.body);
      User userData = User.fromJson(decodedJson);
      return userData;

    } else {
      throw const ServerException();

    }
  }

  @override
  Future<String> signUpNewUser(User user) async {
    final body = {
      "name": user.name,
      "email": user.email,
      "password": user.password,
    };
    final encodedJsonBody = json.encode(body);
    final response = await client.post(Uri.parse(ApiPath.signUpEndPoint),
        headers: headers, body: encodedJsonBody);

    if (response.statusCode == 200) {
      return _msgFromApi(response.body);

    } else if (response.statusCode == 400) {
      FailuresMsgs.clientFailureMsg=_msgFromApi(response.body);
      throw const ClientException();

    } else {
      FailuresMsgs.serverFailureMsg=_msgFromApi(response.body);
      throw const ServerException();

    }
  }

  String _msgFromApi(String responseBody) {
    final decodedJson = json.decode(responseBody);
    final String successOrFailedMsgFromApi= decodedJson["msgFromApi"];
    return successOrFailedMsgFromApi;
  }
  
}
