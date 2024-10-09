import 'package:amazon_clone_app/core/constants/api_path.dart';
import 'package:amazon_clone_app/features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:amazon_clone_app/features/auth/data/models/user.dart';
import '../../../../../core/constants/app_constant_text.dart';
import '../../../../../core/utils/helpers/api_helper.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSourceImplWithHttp implements AuthRemoteDataSource {
  final http.Client client;

  const AuthRemoteDataSourceImplWithHttp({required this.client});

  @override

  Future<String> signIn(User user) async {
    final http.Response response = await ApiHelper.postRequest(
        url: ApiPath.signInEndPoint, body: user.toJson());

    return ApiHelper.handleResponse<String>(
        response: response,
        onSuccess: /*<String>*/(decodedJson) => decodedJson["userToken"]);
  }

  @override
  Future<String> signUpNewUser(User user) async {

    final http.Response response = await ApiHelper.postRequest(
        url: ApiPath.signUpEndPoint, body: user.toJson());

    return ApiHelper.handleResponse<String>(
        response: response,
        onSuccess: /*<String>*/(decodedJson) => decodedJson["responseFromApi"]);
  }

  @override
  Future<User> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final String userToken =
        prefs.get(AppConstantText.keyForCachedUserToken).toString();
    final http.Response response = await ApiHelper.getRequest(
        url: ApiPath.getUserDataEndPoint, userToken: userToken);
        
    return ApiHelper.handleResponse<User>(
        response: response,
        onSuccess: /*<UserEntity>*/(decodedJson) => User.fromJson(decodedJson));
  }
}
