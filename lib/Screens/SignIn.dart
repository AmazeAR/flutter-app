import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/RectangleButton.dart';
import 'package:flutter_amaze_ar/Components/appBarWithProfileIcon.dart';
import 'package:flutter_amaze_ar/Components/background.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/Sizes.dart';
import 'package:flutter_amaze_ar/Screens/Category/Categories.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'dart:async';
import 'dart:convert' show json;

import "package:http/http.dart" as http;


class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  GoogleSignInAccount? _currentUser;
  String _contactText = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser!);
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'];
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    GoogleSignInAccount? user = _currentUser;
    return Scaffold(
      appBar: AppBar(
        title: user != null ? Text("Welcome") : Text("SignIn With Google"),
      ),

      body: Background(
        child: user == null
            ? Column(
                children: <Widget>[
                  Expanded(
                      child: Center(
                    child: ElevatedButton(
                      child: const Text('Move to Categories'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Categories()));
                      },
                    ),
                  )),
                  ElevatedButton(
                    child: const Text('SIGN OUT'),
                    onPressed: _handleSignOut,
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "AmazeAr",
                    style: TextStyle(
                        fontSize: h1,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "Visuslize the better together",
                    style: TextStyle(
                        fontSize: h2,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.1),
                  Container(
                    child: RectangleButton(
                      text: "SignIn With Google ",
                      color: primaryColor,
                      onTap: handleSignIn,
                    ),
                  )
                ],
              ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
