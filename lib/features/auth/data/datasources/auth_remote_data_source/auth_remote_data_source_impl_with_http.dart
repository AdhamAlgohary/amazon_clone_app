import 'dart:convert';
import 'package:amazon_clone_app/core/error/exception.dart';
import 'package:amazon_clone_app/core/strings/end_points/auth_end_points.dart';
import 'package:amazon_clone_app/features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:amazon_clone_app/features/auth/data/models/user.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSourceImplWithHttp implements AuthRemoteDataSource {
  final http.Client client;
  const AuthRemoteDataSourceImplWithHttp({required this.client});

  @override
  Future<User> signIn({required String email, required String password}) async {
    final body = {"email": email, "password": password};
    final response =
        await client.post(Uri.parse(AuthEndPoints.signInEndPoint), body: body);
    final responseIsRightCondition = response.statusCode == 200;
    if (responseIsRightCondition) {
      final Map<String, dynamic> decodedJson = json.decode(response.body);
      User userData = User.fromJson(decodedJson);
      return userData;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<User> signUpNewUser(
      {required String name,
      required String email,
      required String password}) async {
    final body = {
      "name": name,
      "email": email,
      "password": password,
    };
    final response =
        await client.post(Uri.parse(AuthEndPoints.signUpEndPoint), body: body);
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedJson = json.decode(response.body);
      User userData = User.fromJson(decodedJson);
      return userData;
    
    } else {
      throw ServerException();
    }
  }
}
