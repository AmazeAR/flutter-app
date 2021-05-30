import 'package:localstorage/localstorage.dart';

class UserModel {
  final String userId;
  final String fullName;
  final String emailId;
  final String profileURL;

  UserModel(
      {required this.userId,
      required this.fullName,
      required this.emailId,
      this.profileURL = ''});

  static String getUserId() {
    final storage = LocalStorage("amaz_ar");
    return UserModel.fromJson(storage.getItem("user")).userId;
  }

  static String getGroupId() {
    final storage = LocalStorage("amaz_ar");
    String grpId = storage.getItem("groupId");
    return grpId;
  }

  static UserModel getUser() {
    final storage = LocalStorage("amaz_ar");
    return UserModel.fromJson(storage.getItem("user"));
  }

  static Future<UserModel> getUserFromLocalStorage() async {
    final storage = LocalStorage('amaz_ar');
    await storage.ready;
    final userJson = storage.getItem('user');
    return UserModel.fromJson(userJson);
  }

  static Future<String> getUserIdFromLocalStorage() async {
    final storage = LocalStorage('amaz_ar');
    await storage.ready;
    final userJson = storage.getItem('user');
    return (UserModel.fromJson(userJson)).userId;
  }

  Map<String, dynamic> toJson() {
    return ({
      'userId': userId,
      'fullName': fullName,
      'emailId': emailId,
      'profileImage': profileURL
    });
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userId: json['userId'] as String,
        fullName: json['fullName'] as String,
        emailId: json['emailId'] as String,
        profileURL: json['profileImage'] as String);
  }
}
