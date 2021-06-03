import 'dart:io';
import 'package:localstorage/localstorage.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_amaze_ar/Constants/constants.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class MeetServices {
  String serverText = kServerUrl;
  UserModel user = UserModel.getUser();
  final iosAppBarRGBAColor = "#0080FF80"; //transparent blue

  String getUid() {
    var uuid = Uuid();
    return uuid.v4().toString();
  }

  joinMeeting({required String meetName}) async {
    String? serverUrl = serverText.trim().isEmpty ? null : null;

    // Enable or disable any feature flag here
    // If feature flag are not provided, default values will be used
    // Full list of feature flags (and defaults) available in the README
    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      FeatureFlagEnum.MEETING_PASSWORD_ENABLED: true,
      FeatureFlagEnum.PIP_ENABLED: true,
    };
    if (!kIsWeb) {
      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }
    // Define meetings options here

    var options = JitsiMeetingOptions(room: meetName)
      ..serverURL = serverUrl
      ..userDisplayName = user.fullName
      ..userEmail = user.emailId
      ..userAvatarURL = user.profileURL
      ..iosAppBarRGBAColor = iosAppBarRGBAColor
      ..audioMuted = true
      ..videoMuted = true
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": meetName,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": user.fullName}
      };

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {
            // debugPrint("${options.room} will join with message: $message");
          },
          onConferenceJoined: (message) {
            final LocalStorage storage = LocalStorage('amaz_ar');
            storage.setItem("groupId", meetName);
            print(storage.getItem("groupId"));
            // debugPrint("${options.room} joined with message: $message");
          },
          onConferenceTerminated: (message) {
            // debugPrint("${options.room} terminated with message: $message");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("readyToClose callback");
                }),
          ]),
    );
  }

  void onConferenceWillJoin(message) {
    // debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void onConferenceJoined(message) {
    // final LocalStorage storage = LocalStorage('amaz_ar');
    // storage.setItem("groupId", "123");
    // debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void onConferenceTerminated(message) {
    // debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  onError(error) {
    // debugPrint("_onError broadcasted: $error");
  }
}
