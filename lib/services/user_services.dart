import 'dart:convert';
import 'package:flutter_amaze_ar/Constants/Constants.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:http/http.dart' as http;

class HttpUserServices {
  Future<void> postUser(UserModel userModel) async {
    http.Response res = await http.post(
      Uri.https(kServerUrl, 'users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'userId': userModel.userId,
          'fullName': userModel.fullName,
          'emailId': userModel.emailId,
          'profileImage': userModel.profileURL,
        },
      ),
    );
    if (res.statusCode == 200) {
      print("user successfully posted!");
      var body = json.decode(res.body);
      print(body);
    }
    else {
      throw Exception("Failed to post user to database!");
    }
  }
}
