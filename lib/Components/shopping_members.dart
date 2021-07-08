import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:flutter_amaze_ar/services/shoppingMember_services.dart';

class ShoppingMembers extends StatefulWidget {
  final String groupId;

  const ShoppingMembers({required this.groupId});

  @override
  _ShoppingMembersState createState() => _ShoppingMembersState();
}

class _ShoppingMembersState extends State<ShoppingMembers> {
  final HttpShoppingMemberServices shoppingMemberServices =
      HttpShoppingMemberServices();
  late Future<List<UserModel>> userListFuture;

  @override
  void initState() {
    super.initState();
    userListFuture = shoppingMemberServices.getAllMembersOfShoppingGroup(
        groupId: widget.groupId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: userListFuture,
        builder:
            (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
          if (snapshot.hasData) {
            List<UserModel> userList = snapshot.data!;

            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 25.0),
              children: [
                ...userList
                    .map(
                      (UserModel member) => MemberTile(
                        shoppingMemberServices: shoppingMemberServices,
                        member: member,
                        groupId: widget.groupId,
                      ),
                    )
                    .toList(),
              ],
            );
          } else if (snapshot.hasError) {
            print('${snapshot.error}');
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class MemberTile extends StatelessWidget {
  const MemberTile({
    required this.shoppingMemberServices,
    required this.member,
    required this.groupId,
  });

  final HttpShoppingMemberServices shoppingMemberServices;
  final UserModel member;
  final String groupId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(member.profileURL),
          ),
        ),
      ),
      title: Text(
        member.fullName,
        style: TextStyle(
          fontSize: 22.0,
        ),
        overflow: TextOverflow.fade,
      ),
      subtitle: Text(
        member.emailId,
        overflow: TextOverflow.fade,
      ),
      trailing: IconButton(
        onPressed: () async {
          // remove member from group
          String message =
              await shoppingMemberServices.removeMemberFromShoppingGroup(
            groupId: groupId,
            userId: member.userId,
          );
          // displaying snackbar for feedback
          final snackBar = SnackBar(
              content: Text(
            message,
            textAlign: TextAlign.center,
          ));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        icon: Icon(
          Icons.remove_circle,
          size: 32.0,
          color: kSecondaryColor,
        ),
      ),
    );
  }
}
