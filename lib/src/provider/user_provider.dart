
import 'dart:convert';

import 'package:course_project/src/model/data.dart';
import 'package:course_project/src/util/const.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';

class UserApiProvider {

  Future<UserData> fetchUser() async {

    final response = await Dio().get(AppConst.URL);
    if (response.statusCode == AppConst.STATUS_CODE_SUCCEED) {
      // If the call to the server was successful, parse the JSON
      return UserData.fromJson(response.data);
    } else {
          throw Exception('Failed to load post');
    }
  }
}


