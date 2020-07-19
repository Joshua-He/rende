import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:rende/ItemCards/ItemList.dart';
import 'package:rende/LargeComponents/AlertPage.dart';
import 'package:rende/SmallComponents/LineWithText.dart';
import 'package:rende/SmallComponents/TextRow.dart';
import 'package:rende/TabBar/HomeTab.dart';
import 'package:rende/TabBar/PersonalPage/ProfileMain.dart';
import 'package:rende/TabBar/Search/SearchRoom.dart';
import 'package:rende/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  ///Global Functions
  ///
  ///

  bool tab4 = false;

  @override
  Widget build(BuildContext context) {
    ///Functions and Constants
    ///
    ///
    ///Tab Bar Constants
    Size size = MediaQuery.of(context).size;
    double h = size.height * 1;
    double w = size.width * 1;
    double width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    double height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    double aspectRatio = height / width;
    if (aspectRatio > 2.05) {
      height *= 0.97;
      width *= 1.18;
    } else if (aspectRatio < 2.05 && aspectRatio > 2) {
      height *= 0.98;
      width *= 1.08;
    } else if (aspectRatio < 2 && aspectRatio > 1.85) {
      height *= 0.95;
      width *= 1.02;
    } else {
      width *= 1.01;
    }

    //Create Room Function
    //Pop Up Information When Pressing on Pop Up Button
    void _showDialog2(String title) {
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

    //Pop Up SEARCH TOOL
    void dialog(BuildContext context) {
      showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 300),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /*
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                    color: CupertinoColors.lightBackgroundGray,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                height: height * 0.012,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        padding: EdgeInsets.only(right: width * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Icon(Icons.close)],
                        )),
                  ),
                ),
              ),
              */
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.003, horizontal: height * 0.003),
                  height: h - height * 0.06,
                  child: SearchTool(),
                  margin:
                      EdgeInsets.only(bottom: height * 0.01, left: 5, right: 5),
                  decoration: BoxDecoration(
                      color: alexa,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(30),
                          top: Radius.circular(28))),
                ),
              ),
            ],
          );
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
            child: child,
          );
        },
      );
    }

    //Pop Up with SLIDE DOWN
    void _slideDialog() {
      slideDialog.showSlideDialog(
        context: context,
        child: Text("Hello World"),
        barrierColor: Colors.black.withOpacity(0.1),
        pillColor: Colors.red,
        backgroundColor: Colors.yellow,
      );
    }

    ///POP UP FUNCTION BAR FOR THE CENTER BUTTOn
    ///TODO CLOSE THE MENU WHEN ANOTHER SCREEN IS OPENED
    ///
    void _showDashboard(String title) {
      // flutter defined function
      showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.87),
        transitionDuration: Duration(milliseconds: 380),
        context: context,
        transitionBuilder: (context, anim1, anim2, child) {
          return FadeTransition(
            opacity: Tween<double>(
              begin: 0.0,
              end: 0.8,
            ).animate(
              CurvedAnimation(
                parent: anim1,
                curve: Curves.easeIn,
              ),
            ),
            child: child,
          );
        },
        /*

        transitionBuilder: (context, anim1, anim2, child) {
          return ScaleTransition(
            alignment: Alignment.bottomCenter,
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: anim1,
                curve: Curves.easeIn,
              ),
            ),
            child: child,
          );
        },
        */

        pageBuilder: (context, anim1, anim2) {
          // return object of type Dialog
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.only(top: h * 0.04),
            // title: new Text(title),

            content: Tooltip(
              message: "Tap and release to close.",
              decoration: BoxDecoration(color: dgray),
              child: InkWell(
                splashColor: Colors.transparent,
                splashFactory: InkSplash.splashFactory,
                radius: 150,
                highlightColor: Colors.black45,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    ///
                    ///Recent Rooms and CUrrent ROOM
                    new Container(
                      height: h * 0.6 + 30,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding: EdgeInsets.only(
                          left: 0, right: 0, top: 10, bottom: 5),
                      decoration: BoxDecoration(
                          color: alexa,
                          borderRadius: BorderRadius.circular(20)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            HeaderRow(
                              headertext: "Current Room",
                              fsize: 25,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: w * 0.04, vertical: h * 0.03),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightGreenAccent),
                              height: h * 0.23,
                            ),
                            HeaderRow(
                              headertext: "Recent Topics",
                              fsize: 25,
                            ),
                            ItemList(
                              scale: 0.8,
                            ),
                            HeaderRow(
                              headertext: "Recent Topics",
                              fsize: 25,
                            ),
                            ItemList(
                              scale: 0.8,
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///
                    ///Navigation Button Bar
                    new Container(
                      margin: EdgeInsets.only(top: 20),
                      height: height * 0.08,
                      width: w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent),
                      child: Column(
                        children: [
                          //Top/Middle 2 buttons
                          Container(
                            height: h * 0.1 + 10,
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //2nd Button
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  onLongPress: () {
                                    HapticFeedback.heavyImpact();
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: h * 0.08,
                                        width: h * 0.085,
                                        margin: EdgeInsets.only(bottom: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.greenAccent,
                                                width: 2),
                                            shape: BoxShape.circle,
                                            color: dgray),
                                        child: Icon(
                                          Icons.headset,
                                          size: 31,
                                          color: Colors.greenAccent,
                                        ),
                                      ),
                                      Text(
                                        "JOIN",
                                        style: TextStyle(
                                            color: white1,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11.5),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: w * 0.05,
                                ),
                                //Third
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.pop(context);
                                    dialog(context);
                                  },
                                  onLongPress: () {
                                    print("d");
                                    HapticFeedback.heavyImpact();
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: h * 0.08,
                                        width: h * 0.085,
                                        margin: EdgeInsets.only(bottom: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.redAccent,
                                                width: 2),
                                            shape: BoxShape.circle,
                                            color: dgray),
                                        child: Icon(
                                          Icons.search,
                                          size: 35,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      Text(
                                        "SEARCH",
                                        style: TextStyle(
                                            color: white1,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11.5),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //BottomRow 1 and 4
                          Container(
                            height: h * 0.102 + 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ///FIRST POP BUTTON
                                ///
                                ///TODO CREATE SCREEN
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.pop(context);
                                    // _showDialog2("title");
                                    Navigator.pushNamed(context, '/ucla');
                                  },
                                  onLongPress: () {
                                    print("d");
                                    HapticFeedback.heavyImpact();
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: h * 0.08,
                                        width: h * 0.085,
                                        margin: EdgeInsets.only(bottom: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.orangeAccent,
                                                width: 2),
                                            shape: BoxShape.circle,
                                            color: dgray),
                                        child: Icon(
                                          Icons.add_call,
                                          size: 31,
                                          color: Colors.orangeAccent,
                                        ),
                                      ),
                                      Text(
                                        "CREATE",
                                        style: TextStyle(
                                            color: white1,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11.5),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: w * 0.2 + 15,
                                ),

                                ///
                                ///
                                ///4th Wheel Button
                                ///
                                ///TODO CREATE SCREEN
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    dialog(context);
                                  },
                                  onLongPress: () {
                                    print("d");
                                    HapticFeedback.heavyImpact();
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: h * 0.08,
                                        width: h * 0.085,
                                        margin: EdgeInsets.only(bottom: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.blueAccent,
                                                width: 2),
                                            shape: BoxShape.circle,
                                            color: dgray),
                                        child: Icon(
                                          Icons.chat_bubble_outline,
                                          size: 31,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      Text(
                                        "CHAT",
                                        style: TextStyle(
                                            color: white1,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11.5),
                                      )
                                    ],
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
          );
        },
      );
    }

    return ColorfulSafeArea(
      color: Colors.black87,
      child: Container(
        color: Colors.transparent,
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            ///Floating Action Button In the Middle
            floatingActionButton: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: SizedBox(
                height: 70,
                width: 70,
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  elevation: 0,

                  ///On Pressed Open Up Room Selection Menu
                  ///Recents, Start a Room, etc
                  onPressed: () {
                    _showDashboard("d");
                  },
                  child: Container(
                    height: h * 0.08,
                    width: h * 0.085,
                    decoration: BoxDecoration(
                        border: Border.all(color: alexaYellow, width: 3),
                        shape: BoxShape.circle,
                        color: Colors.black),
                    child: Icon(
                      Icons.hearing,
                      size: 31,
                      color: alexaYellow,
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,

            ///End Floating Button

            //App Bar Color
            backgroundColor: Colors.black87,
            bottomNavigationBar: Theme(
              data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent),
              child: TabBar(
                labelColor: Colors.deepOrangeAccent,
                unselectedLabelColor: Colors.white38,

                /*
                indicator: BoxDecoration(
                    color: lightener, borderRadius: BorderRadius.circular(40)),

                    */
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 0.1,
                tabs: [
                  //First Tab
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 5,
                      ),
                      Icon(
                        Icons.adjust,
                        size: 24,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 11),
                      )
                    ],
                  ),

                  Container(
                    margin: EdgeInsets.only(right: width * 0.03, top: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.featured_video,
                          size: 24,
                        ),
                        Text(
                          'Find',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 11),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width * 0.03, top: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 24,
                        ),
                        Text(
                          'Chat',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 11),
                        )
                      ],
                    ),
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 5,
                      ),
                      Icon(
                        Icons.portrait,
                        size: 24,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 11),
                      )
                    ],
                  ),
                ],
              ),
            ),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                HomeTab(),

                //SearchTool(title: 'ListView with Search'),
                ProfilePage(),
                Text("Testing"),
                ProfilePage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
