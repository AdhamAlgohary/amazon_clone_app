import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/data/data_import_packages.dart';

import 'package:http/http.dart' as http;

class AuthRemoteDataSourceImplWithHttp implements AuthRemoteDataSource {
  final http.Client client;

  const AuthRemoteDataSourceImplWithHttp({required this.client});

  @override
  Future<User> signIn(User user) async {
    final http.Response response = await ApiHelper.postRequest(
        url: ApiPath.signInEndPoint, body: user.toJson());

    return ApiHelper.handleResponse<User>(
        response: response, onSuccess: (decodedJson) => decodedJson);
  }

  @override
  Future<String> signUpNewUser(User user) async {
    final http.Response response = await ApiHelper.postRequest(
        url: ApiPath.signUpEndPoint, body: user.toJson());

    return ApiHelper.handleResponse<String>(
        response: response,
        onSuccess: (decodedJson) => decodedJson["responseFromApi"]);
  }

  @override
  Future<User> getUserData({required String userToken}) async {
    final http.Response response = await ApiHelper.getRequest(
        url: ApiPath.getUserDataEndPoint, userToken: userToken);

    return ApiHelper.handleResponse<User>(
        response: response, onSuccess: (decodedJson) => decodedJson);
  }
}
