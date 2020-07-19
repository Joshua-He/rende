import 'package:flutter/material.dart';
import 'package:rende/constants.dart';

class SignUpName extends StatefulWidget {
  @override
  _SignUpNameState createState() => _SignUpNameState();
}

class _SignUpNameState extends State<SignUpName> {
  var _controllerFirstName = TextEditingController();
  var _controllerLastName = TextEditingController();
  var _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;

    double height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;

    double aspectRatio = height / width;

    if (aspectRatio > 1.89) {
      height *= 0.95;
      width *= 1.14;
    }

    void initState() {
      super.initState();
      _controllerFirstName = TextEditingController();
      _controllerLastName = TextEditingController();
      _controllerEmail = TextEditingController();
    }

    void dispose() {
      // Clean up the controller when the widget is disposed.
      _controllerFirstName.dispose();
      _controllerLastName.dispose();
      _controllerEmail.dispose();
      super.dispose();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        children: [
          Container(
            height: height * 0.02,
          ),
          //First TEXT FORM
          Container(
            decoration: BoxDecoration(
              //color: lightener,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextFormField(
              onTap: () {},
              controller: _controllerFirstName,
              cursorWidth: 3,
              cursorRadius: Radius.circular(10),
              //Text
              style: TextStyle(color: alexaYellow, fontWeight: FontWeight.w500),
              cursorColor: alexa,
              //Button Clear
              decoration: InputDecoration(
                suffixIcon: _controllerFirstName.text.length > 0
                    ? IconButton(
                        onPressed: () => _controllerFirstName.clear(),
                        icon: Icon(
                          Icons.cancel,
                          color: alexaYellow,
                        ),
                      )
                    : Container(
                        width: 100,
                      ),
                labelText: "First Name",
                labelStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.only(left: width * 0.013),
                //Regular Border
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: offw,
                      width: 2,
                    )),
                //On Press border
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
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
            height: height * 0.008,
          ),

          //Second FormField
          Container(
              decoration: BoxDecoration(
                //color: lightener,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextFormField(
                onTap: () {},
                controller: _controllerLastName,
                style:
                    TextStyle(color: alexaYellow, fontWeight: FontWeight.w500),
                cursorColor: alexa,
                decoration: InputDecoration(
                  //Text Color
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: "Last Name",
                  //Button
                  suffixIcon: _controllerLastName.text.length > 0
                      ? IconButton(
                          onPressed: () => _controllerLastName.clear(),
                          icon: Icon(
                            Icons.cancel,
                            color: alexaYellow,
                          ),
                        )
                      : Container(
                          width: 100,
                        ),
                  contentPadding: EdgeInsets.only(left: width * 0.013),
                  //Regular Border
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: offw,
                        width: 2,
                      )),
                  //On Press Border
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
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

          //Email
          Container(
              decoration: BoxDecoration(
                //color: lightener,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextFormField(
                onTap: () {},
                controller: _controllerEmail,
                style:
                    TextStyle(color: alexaYellow, fontWeight: FontWeight.w500),
                cursorColor: alexa,
                decoration: InputDecoration(
                  //Text Color
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: "Email",
                  //Button
                  suffixIcon: _controllerEmail.text.length > 0
                      ? IconButton(
                          onPressed: () => _controllerEmail.clear(),
                          icon: Icon(
                            Icons.cancel,
                            color: alexaYellow,
                          ),
                        )
                      : Container(
                          width: 100,
                        ),
                  contentPadding: EdgeInsets.only(left: width * 0.013),
                  //Regular Border
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: offw,
                        width: 2,
                      )),
                  //On Press Border
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
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
    );
  }
}
