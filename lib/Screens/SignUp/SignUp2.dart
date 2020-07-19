import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rende/Screens/SignUp/SignUpName.dart';
import 'package:rende/Screens/SignUp/SignUpPassword.dart';
import 'package:rende/SmallComponents/ActionButton.dart';
import 'package:rende/SmallComponents/TextRow.dart';
import 'package:rende/constants.dart';

class SignUpPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Aspect Ratio Variables
    double width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    double height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    double aspectRatio = height / width;
    if (aspectRatio > 1.89) {
      height *= 0.95;
      width *= 1.14;
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
                        top: height * 0.01, bottom: height * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeaderRow(
                            headertext: "Security", fsize: 40, color: alexa)
                      ],
                    ),
                  ),

                  //Sheet + Form
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: width * 0.012, right: width * 0.012),
                      decoration: BoxDecoration(
                        color: alexa,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: height * 0.03,
                                left: width * 0.03,
                                bottom: height * 0.022),
                            child: HeaderRow(
                              headertext: "Password",
                              limit: 20,
                            ),
                          ),
                          SignUpPassword(),
                          Container(height: height * 0.024),
                          ActionButton(
                            color: alexaYellow,
                            name: "Finish",
                            textColor: alexa,
                            pressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                          )
                        ],
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
