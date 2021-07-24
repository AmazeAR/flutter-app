import 'dart:convert';
import 'package:flutter_amaze_ar/Constants/Constants.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:flutter_amaze_ar/services/cart_services.dart';
import 'package:http/http.dart' as http;

class HttpShoppingMemberServices {
  // fetch all members of a shopping group
  Future<List<UserModel>> getAllMembersOfShoppingGroup(
      {required String groupId}) async {
    final String url = '/meetparticipants/$groupId';

    final res = await http.get(
      Uri.https(kServerUrl, url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      var body = json.decode(res.body);

      List<dynamic>? memberListJson = body['data'];

      List<UserModel> memberList = memberListJson!
          .map((dynamic memberJson) => UserModel.fromJson(memberJson))
          .toList();

      return memberList;
    } else {
      throw Exception("Failed to fetch all members of a group: $groupId");
    }
  }

  // add a shopping group member to database
  Future addMemberToShoppingGroup({
    required String groupId,
    required String userId,
  }) async {
    final String url = '/meetparticipants/$groupId/$userId';

    final res = await http.post(
      Uri.https(kServerUrl, url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      var body = json.decode(res.body);
      var data = body['data'];
      print(data);
    } else {
      throw Exception("Failed to add member: $userId to group: $groupId");
    }
  }

  // remove a shopping group member from database
  Future<String> removeMemberFromShoppingGroup({
    required String groupId,
    required String userId,
  }) async {
    final String url = '/meetparticipants/$groupId/$userId';

    final res = await http.delete(
      Uri.https(kServerUrl, url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    // removing this groupMeet cart for that user
    final HttpCartServices cartServices = HttpCartServices();
    await cartServices.removeShoppingGroup(userId: userId, groupId: groupId);

    if (res.statusCode == 200) {
      var body = json.decode(res.body);
      var data = body['data'];
      print(data);
      return "member successfully removed!";
    } else {
      throw Exception("Failed to remove member: $userId from group: $groupId");
    }
  }
}
