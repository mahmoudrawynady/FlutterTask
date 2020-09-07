import 'dart:async';
import 'package:course_project/src/model/data.dart';
import 'package:course_project/src/provider/user_provider.dart';

class UserRepository {
  final moviesApiProvider = UserApiProvider();

  Future<UserData> fetchAllUsers() => moviesApiProvider.fetchUser();
}