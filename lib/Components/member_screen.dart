import 'package:flutter/material.dart';

class MemberScreeen extends StatefulWidget {
  @override
  _MemberScreeenState createState() => _MemberScreeenState();
}

class _MemberScreeenState extends State<MemberScreeen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Widget _memberCard() {
      return Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.070,
                ),
                Icon(
                  Icons.person,
                  size: size.height * 0.06,
                  color: Colors.white,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mic_none,
                      size: size.height * 0.039,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: size.width * 0.07,
                    ),
                    Icon(
                      Icons.remove_circle_outline,
                      size: size.height * 0.039,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
              child: Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _memberCard(),
                _memberCard(),
                _memberCard(),
                _memberCard(),
                _memberCard(),
                _memberCard(),
                _memberCard(),
              ],
            ),
          )),
          Container(
              alignment: Alignment.center,
              height: size.height * 0.1,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.mic,
                      size: size.height * 0.039,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.present_to_all,
                      size: size.height * 0.039,
                      color: Colors.white,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
