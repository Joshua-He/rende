import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:rende/AccountInformation/user.dart';
import 'package:rende/LargeComponents/GridList.dart';
import 'package:rende/SmallComponents/InfoButton.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:rende/SmallComponents/TextRow.dart';
import 'package:rende/TabBar/PersonalPage/Avatar.dart';
import 'package:rende/TabBar/PersonalPage/ProfileSettings.dart';
import 'package:rende/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  ProfilePage({this.user});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    double height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    double aspectRatio = height / width;
    if (aspectRatio > 2.05) {
      height *= 0.95;
      width *= 1.2;
    } else if (aspectRatio < 2.05 && aspectRatio > 1.9) {
      height *= 0.98;
      width *= 1.1;
    } else if (aspectRatio < 2 && aspectRatio > 1.85) {
      height *= 0.95;
      width *= 1.05;
    } else {
      width *= 1.01;
    }

    //Pop up function
    void _showDialog(String title) {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(title),
            content: new Container(
              height: size.height * 0.9,
              width: size.width * 1,
              child: SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              ),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    //Settings
    void settings() {
      slideDialog.showSlideDialog(
        context: context,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: GridList()),
        barrierColor: Colors.black.withOpacity(0.7),
        pillColor: Colors.red,
        backgroundColor: alexa,
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: ColorfulSafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(45),
              child: Container(
                height: 45,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '@' + "TheReptilian",
                        style: TextStyle(
                            color: white1,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 6),
                        child: IconButton(
                            icon: Icon(
                              Icons.dehaze,
                              size: 28,
                              color: white1,
                            ),
                            onPressed: () {
                              settings();
                            }),
                      ),
                    )
                  ],
                ),
              )),
          body: Container(
            //Main Background Colors
            color: dgray,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Profile Bannr and Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //Interaction Column
                      Container(
                        margin: EdgeInsets.only(
                          right: width * 0.006,
                        ),
                        padding: EdgeInsets.only(top: height * 0.020),
                        height: height * 0.12,
                        width: width * 0.04,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.group_add,
                              color: Colors.blueAccent,
                              size: 30,
                            ),
                            Container(height: height * 0.02),
                            Icon(
                              Icons.message,
                              color: Colors.greenAccent,
                              size: 30,
                            ),
                            Container(height: height * 0.02),
                            Icon(
                              Icons.settings,
                              color: Colors.grey,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                      //Profile Banner and Picture Column
                      Container(
                        height: height * 0.13,
                        width: width * 0.24 - 25,
                        decoration: BoxDecoration(
                          color: lightener,
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.transparent.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: AssetImage(banner),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30)),
                        ),
                        //Column of Information, PICTURE NAME USERNAME
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: height * 0.01, right: width * 0.09),
                              child: Avatar(
                                picture: AssetImage(zuck),
                                size: 80,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: width * 0.02, top: height * 0.012),
                              child: Row(
                                children: [
                                  ///
                                  ///Name and Username
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Mark Zuckerberg",
                                        softWrap: true,
                                        style: TextStyle(
                                          color: white1,
                                          fontSize: 28,
                                        ),
                                      ),
                                      Container(
                                        height: 4,
                                      ),
                                      Text(
                                        "@TheReptilian1337",
                                        style: TextStyle(
                                          color: offw,
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  ///
                  ///About Information
                  Container(
                    margin: EdgeInsets.only(
                        right: width * 0.03, top: height * 0.015),
                    padding: EdgeInsets.only(
                        left: width * 0.012,
                        top: height * 0.008,
                        right: width * 0.008,
                        bottom: height * 0.008),
                    decoration: BoxDecoration(
                        color: alexaContrast,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    width: width * 0.255,
                    height: height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width * 0.22 - 18,
                          height: height * 0.045,
                          child: Text(
                            '''I am the CEO of Facebook. One of the greatest companies in the history of the world. I accumulate more data during my bathroom breaks than the rest of humanity. #Hibernation #ColdBlooded #RodentsAreDelicious''',
                            style: TextStyle(color: Colors.white70),
                            overflow: TextOverflow.clip,
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    height: height * 0.03,
                    margin: EdgeInsets.only(
                        right: width * 0.014,
                        top: height * 0.015,
                        left: width * 0.014),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Colors.white60,
                          width: 1.4,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: Colors.pinkAccent,
                              size: 28,
                            ),
                            Text(
                              ' 2',
                              style: TextStyle(color: offw),
                            )
                          ],
                        ),
                        Container(
                          width: width * 0.028,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.accessible_forward,
                              color: Colors.lightBlueAccent,
                              size: 28,
                            ),
                            Text(
                              ' 56',
                              style: TextStyle(color: offw),
                            )
                          ],
                        ),
                        Container(
                          width: width * 0.028,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                              color: Colors.greenAccent,
                              size: 28,
                            ),
                            Text(
                              ' 190B',
                              style: TextStyle(color: offw),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: HeaderRow(
                      headertext: "Settings",
                      color: white1,
                    ),
                  ),

                  Divider(
                    color: offw,
                    indent: 20,
                    endIndent: 20,
                    thickness: 3,
                  ),

                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.01)),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: GridList()),

                  Divider(
                    thickness: 1.5,
                    color: offwd,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: HeaderRow(
                      headertext: "Tiers and Pricing",
                      color: white1,
                    ),
                  ),
                  //Buttons
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: InfoButton(
                            title: "Title",
                            icon: Icon(
                              Icons.compare,
                              size: 20,
                            ),
                            name: Text("name"),
                            body: Column(
                              children: [
                                Text("test"),
                              ],
                            ),
                            edge: Colors.green,
                            fill: Colors.red,
                            radius: 10,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: InfoButton(
                            title: "Title",
                            icon: Icon(
                              Icons.compare,
                              size: 20,
                            ),
                            name: Text("name"),
                            body: Column(
                              children: [
                                Text("test"),
                              ],
                            ),
                            edge: Colors.red,
                            fill: Colors.red,
                            radius: 10,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: OutlineButton(
                            onPressed: () {
                              _showDialog("Testing");
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.compare,
                                  size: 20,
                                ),
                                divide(0, 4),
                                Text("Info"),
                              ],
                            ),
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
      ),
    );
  }
}
