import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/shopping_members.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Screens/cart_page.dart';
import 'package:flutter_amaze_ar/models/shoppingGroup_model.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:flutter_amaze_ar/services/cart_services.dart';

class ShoppingGroupItem extends StatelessWidget {
  final ShoppingGroup group;
  const ShoppingGroupItem({required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: kThiredColor,
        elevation: 6.0,
        child: InkWell(
          onTap: () {
            // tap on shopping grp
            final String cartLabel = group.groupName;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Cart(
                  id: group.groupId,
                  isPersonalCartPage: false,
                  cartLabel: cartLabel,
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    color: (UserModel.getGroupId() == group.groupId)
                        ? Colors.green
                        : kSecondaryColor,
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  Text(
                    (UserModel.getGroupId() == group.groupId)
                        ? "Active group"
                        : 'Inactive group',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: (UserModel.getGroupId() == group.groupId)
                          ? Colors.green
                          : kSecondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Text(
                group.groupName,
                style: TextStyle(
                    fontSize: 25.0,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.fade,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      final String cartLabel = group.groupName;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Cart(
                            id: group.groupId,
                            isPersonalCartPage: false,
                            cartLabel: cartLabel,
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.shopping_bag,
                      size: 25,
                    ),
                    label: Text(
                      "Products",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // display the list of members
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return ShoppingMembers(
                            groupId: group.groupId,
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.group,
                      size: 25,
                    ),
                    label: Text(
                      "Members",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      // remove shopping grp from list
                      HttpCartServices httpCartServices = HttpCartServices();
                      final String userId = UserModel.getUserId();
                      String message =
                          await httpCartServices.removeShoppingGroup(
                              userId: userId, groupId: group.groupId);
                      // displaying snackbar for feedback
                      final snackBar = SnackBar(
                          content: Text(
                        message,
                        textAlign: TextAlign.center,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      size: 25,
                    ),
                    label: Text(
                      "Remove",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.yellow.shade700),
                      foregroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.black),
                      overlayColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white),
                    ),
                  ),
                  Text(
                    group.timeStamp,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.fade,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
