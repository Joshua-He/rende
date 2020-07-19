import 'package:flutter/material.dart';
import 'package:rende/constants.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var _controllerFirstName = TextEditingController();
  var _controllerLastName = TextEditingController();
  var _controllerEmail = TextEditingController();
  var _controllerPassword = TextEditingController();
  var _controllerPasswordConfirm = TextEditingController();

  void initState() {
    super.initState();
    _controllerFirstName = TextEditingController();
    _controllerLastName = TextEditingController();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
    _controllerPasswordConfirm = TextEditingController();
  }

  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controllerFirstName.dispose();
    _controllerLastName.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerPasswordConfirm.dispose();
    super.dispose();
  }

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

          ///
          ///third email
          Container(
            decoration: BoxDecoration(
              //color: lightener,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextFormField(
              onTap: () {},
              controller: _controllerEmail,
              cursorWidth: 3,
              cursorRadius: Radius.circular(10),
              //Text
              style: TextStyle(color: alexaYellow, fontWeight: FontWeight.w500),
              cursorColor: alexa,
              //Button Clear
              decoration: InputDecoration(
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
                labelText: "Email",
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

          SizedBox(
            height: height * 0.008,
          ),

          //Fourht FORM FIELD
          ///
          ///
          Container(
            decoration: BoxDecoration(
              //color: lightener,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextFormField(
              onTap: () {},
              controller: _controllerPassword,
              cursorWidth: 3,
              cursorRadius: Radius.circular(10),
              //Text
              style: TextStyle(color: alexaYellow, fontWeight: FontWeight.w500),
              cursorColor: alexa,
              //Button Clear
              decoration: InputDecoration(
                suffixIcon: _controllerPassword.text.length > 0
                    ? IconButton(
                        onPressed: () => _controllerPasswordConfirm.clear(),
                        icon: Icon(
                          Icons.cancel,
                          color: alexaYellow,
                        ),
                      )
                    : Container(
                        width: 100,
                      ),
                labelText: "Password",
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

          //Fourth
          Container(
            decoration: BoxDecoration(
              //color: lightener,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextFormField(
              onTap: () {},
              controller: _controllerPasswordConfirm,
              cursorWidth: 3,
              cursorRadius: Radius.circular(10),
              //Text
              style: TextStyle(color: alexaYellow, fontWeight: FontWeight.w500),
              cursorColor: alexa,
              //Button Clear
              decoration: InputDecoration(
                suffixIcon: _controllerPasswordConfirm.text.length > 0
                    ? IconButton(
                        onPressed: () => _controllerPasswordConfirm.clear(),
                        icon: Icon(
                          Icons.cancel,
                          color: alexaYellow,
                        ),
                      )
                    : Container(
                        width: 100,
                      ),
                labelText: "Confirm Password",
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
        ],
      ),
    );
  }
}
