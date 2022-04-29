import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:testertype/model/user.dart';

class ApiService {
  //dio is for http client.
  final _dio = Dio();

//future User
  Future<List<User>> getApiData() async {
    var response = await _dio.get("https://api.github.com/users");
    if (response.statusCode == 200) {
      List data = response.data;

      List<User> users = [];
      //convert list dynamics to map
      data.map((e) {
        users.add(User.fromJson(e));
      }).toList();

      //print(users);

      return users;
    } else {
      print("Inside else error");
      return [User.withError("No data found")];
    }
  }
}
