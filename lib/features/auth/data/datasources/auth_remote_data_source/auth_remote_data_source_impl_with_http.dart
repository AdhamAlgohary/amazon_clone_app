import 'package:amazon_clone_app/core/constants/api_path.dart';
import 'package:amazon_clone_app/features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:amazon_clone_app/features/auth/data/models/user.dart';

import 'package:http/http.dart' as http;

import '../../../../../core/utils/helpers/api_helper.dart';

class AuthRemoteDataSourceImplWithHttp implements AuthRemoteDataSource {
  final http.Client client;
  static const headers = {"Content-Type": "application/json"};

  const AuthRemoteDataSourceImplWithHttp({required this.client});

  @override
  Future<User> signIn(User user) async {
    final response =
        await ApiHelper.postRequest(url: ApiPath.signInEndPoint, body: user.toJson());
    return ApiHelper.handleResponse(
        response: response,
        onSuccess: (decodedJson) => User.fromJson(decodedJson));
  }

  @override
  Future<String> signUpNewUser(User user) async {
    final response =
        await ApiHelper.postRequest(url: ApiPath.signUpEndPoint, body: user.toJson());
    return ApiHelper.handleResponse<String>(
        response: response,
        onSuccess: <String>(decodedJson) => ApiHelper.msgFromApi(decodedJson));
  }


  
  
}
