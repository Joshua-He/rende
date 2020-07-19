import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rende/Backend/auth.dart';
import 'package:rende/SmallComponents/ActionButton.dart';
import 'package:rende/SmallComponents/TextRow.dart';
import 'package:rende/Backend/backend.dart';
import 'package:rende/constants.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  var _controllerFirstName = TextEditingController();
  var _controllerLastName = TextEditingController();
  var _controllerEmail = TextEditingController();
  var _controllerPassword = TextEditingController();
  var _controllerPasswordConfirm = TextEditingController();
  var _controllerUsername = TextEditingController();

  //Var
  bool isLoading = false;
  AuthMethods authMethods = new AuthMethods();
  void initState() {
    super.initState();
    _controllerFirstName = TextEditingController();
    _controllerLastName = TextEditingController();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
    _controllerPasswordConfirm = TextEditingController();
    _controllerUsername = TextEditingController();
  }

  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controllerFirstName.dispose();
    _controllerLastName.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerPasswordConfirm.dispose();
    _controllerUsername.dispose();
    super.dispose();
  }

  signUpUser() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      /*
      getSignUpData(
              '{"account_name": "${_controllerUsername.text}", "last_name": "${_controllerLastName.text}", "first_name": "${_controllerFirstName.text}", "password": "${_controllerPassword.text}"}')
          .then((val) {
        print('$val');
      });
      */

      authMethods.signUpWithEmailAndPassword(
          _controllerEmail.text, _controllerPassword.text);
      Navigator.of(context).popUntil(ModalRoute.withName('/'));
    }
  }

  @override
  Widget build(BuildContext context) {
    //Aspect Ratio Variables
    double width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;

    double height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;

    double aspectRatio = height / width;

    if (aspectRatio > 2.05) {
      height *= 0.95;
      width *= 1.16;
    } else if (aspectRatio < 2.05 && aspectRatio > 2) {
      height *= 0.96;
      width *= 1.01;
    } else if (aspectRatio < 2 && aspectRatio > 1.85) {
      height *= 0.95;
      width *= 1.00;
    } else {
      width *= 1.01;
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Material(
        child: ColorfulSafeArea(
          color: alexa,
          child: Container(
            //padding: EdgeInsets.only(left: width * 0.01, right: width * 0.01),
            color: alexaYellowContrast,
            child: InkWell(
              onDoubleTap: () {
                Navigator.pop(context);
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: height * 0.00, bottom: height * 0.00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: alexa,
                              size: 24,
                            ),
                            onPressed: () => Navigator.pop(context))
                      ],
                    ),
                  ),
                  //Sign UP TITLE
                  Container(
                    padding: EdgeInsets.only(
                        top: height * 0.002, bottom: height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeaderRow(
                            headertext: "Let's Start", fsize: 40, color: alexa)
                      ],
                    ),
                  ),

                  //Sheet + Form
                  Form(
                    key: formKey,
                    child: Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: width * 0.0, right: width * 0.000),
                        decoration: BoxDecoration(
                          color: alexa,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                        ),
                        child: Column(
                          children: [
                            //FIRST LAST EMAIL FORM
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02),
                              child: Column(
                                children: [
                                  Container(
                                    height: height * 0.02,
                                  ),
                                  //First NAME TEXT FORM
                                  Row(
                                    children: [
                                      Container(
                                        width: width * 0.12,
                                        decoration: BoxDecoration(
                                          //color: lightener,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: TextFormField(
                                          validator: (val) {
                                            return (val.isEmpty)
                                                ? "First Name is Empty"
                                                : null;
                                          },
                                          onTap: () {},
                                          controller: _controllerFirstName,
                                          cursorWidth: 3,
                                          cursorRadius: Radius.circular(10),
                                          //Text
                                          style: TextStyle(
                                              color: white1,
                                              fontWeight: FontWeight.w500),
                                          cursorColor: white1,
                                          //Button Clear
                                          decoration: InputDecoration(
                                            suffixIcon: _controllerFirstName
                                                        .text.length >
                                                    0
                                                ? IconButton(
                                                    onPressed: () =>
                                                        _controllerFirstName
                                                            .clear(),
                                                    icon: Icon(
                                                      Icons.cancel,
                                                      color: alexaYellow,
                                                    ),
                                                  )
                                                : Container(
                                                    width: 100,
                                                  ),
                                            labelText: "First",
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            contentPadding: EdgeInsets.only(
                                                left: width * 0.013),
                                            //Regular Border
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                  color: offw,
                                                  width: 2,
                                                )),
                                            //On Press border
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                  color: alexaYellowContrast,
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
                                        ),
                                      ),
                                      //LAST NAME TEXT FORM
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: width * 0.005),
                                          width: width * 0.12,
                                          decoration: BoxDecoration(
                                            //color: lightener,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: TextFormField(
                                            validator: (val) {
                                              return val.isEmpty
                                                  ? "Last Name is Empty"
                                                  : null;
                                            },
                                            onTap: () {},
                                            controller: _controllerLastName,
                                            style: TextStyle(
                                                color: white1,
                                                fontWeight: FontWeight.w500),
                                            cursorColor: white1,
                                            decoration: InputDecoration(
                                              //Text Color
                                              labelStyle: TextStyle(
                                                  color: Colors.white),
                                              labelText: "Last",
                                              //Button
                                              suffixIcon: _controllerLastName
                                                          .text.length >
                                                      0
                                                  ? IconButton(
                                                      onPressed: () =>
                                                          _controllerLastName
                                                              .clear(),
                                                      icon: Icon(
                                                        Icons.cancel,
                                                        color: alexaYellow,
                                                      ),
                                                    )
                                                  : Container(
                                                      width: 100,
                                                    ),
                                              contentPadding: EdgeInsets.only(
                                                  left: width * 0.013),
                                              //Regular Border
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  borderSide: BorderSide(
                                                    color: offw,
                                                    width: 2,
                                                  )),
                                              //On Press Border
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  borderSide: BorderSide(
                                                    color: alexaYellowContrast,
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

                                  Container(
                                    height: height * 0.005,
                                  ),

                                  //Email
                                  Container(
                                      decoration: BoxDecoration(
                                        //color: lightener,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: TextFormField(
                                        validator: (val) {
                                          //Vlaid email
                                          Pattern pattern =
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regex = new RegExp(pattern);
                                          return (regex.hasMatch(val))
                                              ? null
                                              : "Please Enter Valid Email";
                                        },
                                        onTap: () {},
                                        controller: _controllerEmail,
                                        style: TextStyle(
                                            color: alexaYellow,
                                            fontWeight: FontWeight.w500),
                                        cursorColor: alexa,
                                        decoration: InputDecoration(
                                          //Text Color
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          labelText: "Email",
                                          //Button
                                          suffixIcon: _controllerEmail
                                                      .text.length >
                                                  0
                                              ? IconButton(
                                                  onPressed: () =>
                                                      _controllerEmail.clear(),
                                                  icon: Icon(
                                                    Icons.cancel,
                                                    color: alexaYellow,
                                                  ),
                                                )
                                              : Container(
                                                  width: 100,
                                                ),
                                          contentPadding: EdgeInsets.only(
                                              left: width * 0.013),
                                          //Regular Border
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              borderSide: BorderSide(
                                                color: offw,
                                                width: 2,
                                              )),
                                          //On Press Border
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              borderSide: BorderSide(
                                                color: alexaYellowContrast,
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
                            //USER NAME
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02),
                              child: Column(
                                children: [
                                  Container(
                                    height: height * 0.005,
                                  ),
                                  //First TEXT FORM
                                  Container(
                                    decoration: BoxDecoration(
                                      //color: lightener,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: TextFormField(
                                      onTap: () {},
                                      controller: _controllerUsername,
                                      cursorWidth: 3,
                                      cursorRadius: Radius.circular(10),
                                      //Text
                                      style: TextStyle(
                                          color: white1,
                                          fontWeight: FontWeight.w500),
                                      cursorColor: white1,
                                      //Button Clear
                                      decoration: InputDecoration(
                                        suffixIcon: _controllerUsername
                                                    .text.length >
                                                0
                                            ? IconButton(
                                                onPressed: () =>
                                                    _controllerUsername.clear(),
                                                icon: Icon(
                                                  Icons.cancel,
                                                  color: alexaYellow,
                                                ),
                                              )
                                            : Container(
                                                width: 100,
                                              ),
                                        labelText: "Username",
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        contentPadding: EdgeInsets.only(
                                            left: width * 0.013),
                                        //Regular Border
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide(
                                              color: offw,
                                              width: 2,
                                            )),
                                        //On Press border
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide(
                                              color: alexaYellowContrast,
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
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //PASSWORD AND CONFIRM PASSWORD
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02),
                              child: Column(
                                children: [
                                  Container(
                                    height: height * 0.005,
                                  ),
                                  //First TEXT FORM
                                  Container(
                                    decoration: BoxDecoration(
                                      //color: lightener,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: TextFormField(
                                      validator: (val) {
                                        Pattern pattern =
                                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\w\W]{8,}$';
                                        RegExp regex = new RegExp(pattern);
                                        return (regex.hasMatch(val))
                                            ? null
                                            : "Please enter at least 8 characters, 1 Upper and 1 number.";
                                      },
                                      obscureText: true,
                                      onTap: () {},
                                      controller: _controllerPassword,
                                      cursorWidth: 3,
                                      cursorRadius: Radius.circular(10),
                                      //Text
                                      style: TextStyle(
                                          color: alexaYellow,
                                          fontWeight: FontWeight.w500),
                                      cursorColor: alexa,
                                      //Button Clear
                                      decoration: InputDecoration(
                                        suffixIcon:
                                            _controllerPassword.text.length > 0
                                                ? IconButton(
                                                    onPressed: () {
                                                      _controllerPassword
                                                          .clear();
                                                      _controllerPasswordConfirm
                                                          .clear();
                                                    },
                                                    icon: Icon(
                                                      Icons.cancel,
                                                      color: alexaYellow,
                                                    ),
                                                  )
                                                : Container(
                                                    width: 100,
                                                  ),
                                        labelText: "Password",
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        contentPadding: EdgeInsets.only(
                                            left: width * 0.013),
                                        //Regular Border
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide(
                                              color: offw,
                                              width: 2,
                                            )),
                                        //On Press border
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide(
                                              color: alexaYellowContrast,
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
                                    ),
                                  ),

                                  Container(
                                    height: height * 0.005,
                                  ),

                                  //Second FormField
                                  Container(
                                      decoration: BoxDecoration(
                                        //color: lightener,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: TextFormField(
                                        validator: (val) {
                                          return val != _controllerPassword.text
                                              ? "Sorry, the passwords do not match."
                                              : null;
                                        },
                                        onTap: () {},
                                        obscureText: true,
                                        controller: _controllerPasswordConfirm,
                                        style: TextStyle(
                                            color: alexaYellow,
                                            fontWeight: FontWeight.w500),
                                        cursorColor: alexa,
                                        decoration: InputDecoration(
                                          //Text Color
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          labelText: "Confirm Password",
                                          //Button
                                          suffixIcon: _controllerPasswordConfirm
                                                      .text.length >
                                                  0
                                              ? IconButton(
                                                  onPressed: () =>
                                                      _controllerPasswordConfirm
                                                          .clear(),
                                                  icon: Icon(
                                                    Icons.cancel,
                                                    color: alexaYellow,
                                                  ),
                                                )
                                              : Container(
                                                  width: 100,
                                                ),
                                          contentPadding: EdgeInsets.only(
                                              left: width * 0.013),
                                          //Regular Border
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              borderSide: BorderSide(
                                                color: offw,
                                                width: 2,
                                              )),
                                          //On Press Border
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              borderSide: BorderSide(
                                                color: alexaYellowContrast,
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

                                  Container(
                                    height: height * 0.008,
                                  ),
                                ],
                              ),
                            ),

                            Container(height: height * 0.0),
                            ActionButton(
                              color: alexaYellow,
                              name: "Next",
                              textColor: alexa,
                              pressed: () {
                                signUpUser();
                                /*
                                getSignUpData(
                                    '{"account_name": "${_controllerUsername.text}", "last_name": "${_controllerLastName.text}", "first_name": "${_controllerFirstName.text}", "password": "${_controllerPassword.text}"}');
                                    */
                                /*
                                Navigator.of(context)
                                    .popUntil(ModalRoute.withName('/'));
                                    */
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
