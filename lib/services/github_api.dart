import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:testertype/model/user.dart';

class ApiService {
  //dio is for http client.
  final _dio = Dio();

//future User
  Future getApiData() async {
    var response = await _dio.get("https://api.github.com/users");
    if (response.statusCode == 200) {
  

     var data  = response.data ; 

      for (var item in data) {
         print(item['login']);
      }


      List<User> users = [];
      //convert list dynamics to map
      var listDataApi = jsonDecode(response.data);
      listDataApi.map((user) {
        users.add(User.fromJson(user));
      }).toList();

      print(users);

      return users;
    } else {
      return User.withError("No data found");
    }
  }
}
