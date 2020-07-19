import 'package:flutter/material.dart';
import 'package:rende/constants.dart';

class SignUpUsername extends StatefulWidget {
  @override
  _SignUpUsernameState createState() => _SignUpUsernameState();
}

class _SignUpUsernameState extends State<SignUpUsername> {
  var _controllerUsername = TextEditingController();

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
      _controllerUsername = TextEditingController();
    }

    void dispose() {
      // Clean up the controller when the widget is disposed.
      _controllerUsername.dispose();
      super.dispose();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
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
              style: TextStyle(color: alexaYellow, fontWeight: FontWeight.w500),
              cursorColor: alexa,
              //Button Clear
              decoration: InputDecoration(
                suffixIcon: _controllerUsername.text.length > 0
                    ? IconButton(
                        onPressed: () => _controllerUsername.clear(),
                        icon: Icon(
                          Icons.cancel,
                          color: alexaYellow,
                        ),
                      )
                    : Container(
                        width: 100,
                      ),
                labelText: "Username",
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
        ],
      ),
    );
  }
}
