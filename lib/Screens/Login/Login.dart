import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rende/Backend/auth.dart';
import 'package:rende/Screens/Login/LoginForm.dart';
import 'package:rende/SmallComponents/ActionButton.dart';
import 'package:rende/SmallComponents/TextRow.dart';
import 'package:rende/Backend/backend.dart';
import 'package:rende/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _controllerName = TextEditingController();
  var _controllerPassword = TextEditingController();

  AuthMethods authMethods = new AuthMethods();

  String phoneNo, verificationId, smsCode;

  bool codeSent = false;

  void initState() {
    super.initState();

    _controllerPassword = TextEditingController();
    _controllerName = TextEditingController();
  }

  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controllerPassword.dispose();
    _controllerName.dispose();
    super.dispose();
  }

  Future<void> verifyPhoneNumber(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {};

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 300),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }

  @override
  Widget build(BuildContext context) {
    ///
    ///
    ///Aspect Ratio Variables
    double width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;

    double height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;

    double aspectRatio = height / width;

    if (aspectRatio > 2.05) {
      height *= 0.95;
      width *= 1.17;
    } else if (aspectRatio < 2.05 && aspectRatio > 1.9) {
      height *= 0.94;
      width *= 1.01;
    } else if (aspectRatio < 2 && aspectRatio > 1.85) {
      height *= 0.95;
      width *= 1.05;
    } else {
      width *= 1.01;
    }

    return Material(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: ColorfulSafeArea(
          color: dgray,
          child: Container(
            padding: EdgeInsets.only(left: width * 0.01, right: width * 0.01),
            color: CupertinoColors.darkBackgroundGray,
            child: Column(
              children: [
                //Padding Top
                Container(
                  height: height * 0.01,
                ),
                //Icon
                Container(
                  height: height * 0.07,
                  margin: EdgeInsets.only(
                    bottom: height * 0.012,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.hearing,
                        color: alexaYellow,
                        size: 67,
                      )
                    ],
                  ),
                ),

                Row(
                  children: [
                    HeaderRow(
                      headertext: "Login",
                      fsize: 40,
                      weight: FontWeight.w600,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: HeaderRow(
                        headertext: "Sign Up",
                        fsize: 39,
                        color: white1.withOpacity(0.3),
                        weight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                //Form FIELDS
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.015,
                      ),
                      //First TEXT FORM
                      Container(
                          decoration: BoxDecoration(
                            //color: lightener,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextFormField(
                            onTap: () {},
                            controller: _controllerName,
                            cursorWidth: 3,
                            cursorRadius: Radius.circular(10),
                            style: TextStyle(color: white1),
                            cursorColor: alexaYellow,
                            decoration: InputDecoration(
                              suffixIcon: _controllerName.text.length > 0
                                  ? IconButton(
                                      onPressed: () => _controllerName.clear(),
                                      icon: Icon(
                                        Icons.cancel,
                                        color: alexaYellowContrast,
                                      ),
                                    )
                                  : Container(
                                      width: 100,
                                    ),
                              labelText: "Username / Email",
                              labelStyle:
                                  TextStyle(color: offw.withOpacity(0.6)),
                              contentPadding:
                                  EdgeInsets.only(left: width * 0.013),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: offw.withOpacity(0.5),
                                    width: 1.3,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: alexaYellow.withOpacity(0.87),
                                    width: 2,
                                  )),
                              /*
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: alexaYellow,
                                      width: 1.5,
                                    ))
                                    */
                            ),
                          )),
                      SizedBox(
                        height: height * 0.008,
                      ),

                      //Second FormField
                      Container(
                          decoration: BoxDecoration(
                            //color: lightener,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextFormField(
                            obscureText: true,
                            onTap: () {},
                            controller: _controllerPassword,
                            style: TextStyle(
                              color: white1,
                            ),
                            cursorColor: alexaYellow,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: offw),
                              labelText: "Password",
                              suffixIcon: _controllerPassword.text.length > 0
                                  ? IconButton(
                                      onPressed: () =>
                                          _controllerPassword.clear(),
                                      icon: Icon(
                                        Icons.cancel,
                                        color: alexaYellowContrast,
                                      ),
                                    )
                                  : Container(
                                      width: 100,
                                    ),
                              contentPadding:
                                  EdgeInsets.only(left: width * 0.013),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: offw.withOpacity(0.55),
                                    width: 1.3,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: alexaYellow.withOpacity(0.87),
                                    width: 2,
                                  )),
                              /*
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: alexaYellow,
                                      width: 1.5,
                                    ))
                                    */
                            ),
                          )),
                    ],
                  ),
                ),

                //Login Button
                ActionButton(
                  color: alexaYellow,
                  name: "Log In",
                  textColor: alexaContrast,
                  pressed: () {
                    FirebaseUser test;
                    authMethods.signInWithEmailAndPassword(
                        _controllerName.text, _controllerPassword.text);
                    /*
                    login(
                        '{"account_name": "${_controllerName.text}", "password": "${_controllerPassword.text}"}');

                        */
                    /*
                    print(
                        '{"account_name": "${_controllerName.text}", "password": "${_controllerPassword.text}"}');
                        */
                    Navigator.pushNamed(context, '/');
                  },
                ),

                SizedBox(
                  height: height * 0.035,
                ),
                //OR
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "_____________________   ",
                            style: TextStyle(color: white1),
                          ),
                        ),
                        Text(
                          "OR",
                          style: TextStyle(color: white1),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "   _____________________",
                            style: TextStyle(color: white1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Row of Alternative Login, TODO LINK UP FB TWITTER GMAIL ETC
                Container(
                  height: height * 0.042,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //GOOGLE SIGN IN
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                        height: width * 0.047,
                        width: width * 0.047,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                MdiIcons.google,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //FACEBOOK LOGIN
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.016),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/phone');
                          },
                          child: Icon(
                            Icons.phone_iphone,
                            color: Colors.white,
                            size: 80,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                        height: width * 0.047,
                        width: width * 0.047,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                MdiIcons.twitter,
                                color: Colors.black,
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
