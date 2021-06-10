import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/appbar.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/Constants.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:flutter_amaze_ar/services/cart_services.dart';
import 'package:flutter_amaze_ar/services/meet_services.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:flutter/cupertino.dart';

class MeetingPage extends StatefulWidget {
  @override
  _MeetingPageState createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  String meetingName = "AmazAR meeting";
  MeetServices meetServices = MeetServices();

  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(
      JitsiMeetingListener(
          onConferenceWillJoin: meetServices.onConferenceWillJoin,
          onConferenceJoined: meetServices.onConferenceJoined,
          onConferenceTerminated: meetServices.onConferenceTerminated,
          onError: meetServices.onError),
    );
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kAppBarSize),
        child: AppBarWithProfileIcon(),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
        child: kIsWeb
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.30,
                    child: meetConfig(),
                  ),
                  Container(
                      width: width * 0.60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                            color: Colors.white54,
                            child: SizedBox(
                              width: width * 0.60 * 0.70,
                              height: width * 0.60 * 0.70,
                              child: JitsiMeetConferencing(
                                extraJS: [
                                  // extraJs setup example
                                  '<script>function echo(){console.log("echo!!!")};</script>',
                                  '<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>'
                                ],
                              ),
                            )),
                      ))
                ],
              )
            : meetConfig(),
      ),
    );
  }

  Widget meetConfig() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            onChanged: (newMeetingName) {
              setState(() {
                meetingName = newMeetingName;
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Meeting Room",
            ),
          ),
          Divider(
            height: 48.0,
            thickness: 2.0,
          ),
          SizedBox(
            height: 64.0,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () async {
                final String editedMeetingName =
                    meetingName.trim().replaceAll(" ", '');

                await meetServices.joinMeeting(meetName: editedMeetingName);

                HttpCartServices httpCartServices = HttpCartServices();

                // add new shopping group in users shopping group list
                String message = await httpCartServices.addNewShoppingGroup(
                    userId: UserModel.getUserId(), groupId: editedMeetingName, groupName: meetingName,);
                print(message);
                // pop everything out from stack and push main page which is category page at this stage
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text(
                "Join Meeting",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => kPrimaryColor)),
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
        ],
      ),
    );
  }
}
