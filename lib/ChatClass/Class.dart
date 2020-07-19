import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rende/ChatClass/HomeInfoTab.dart';
import 'package:rende/ChatClass/Rooms/RoomTab.dart';
import 'package:rende/LargeComponents/AlertPage.dart';
import 'package:rende/SmallComponents/DrawerComponents/DrawerTile.dart';
import 'package:rende/TabBar/Search/SearchRoom.dart';
import 'package:rende/constants.dart';

class PrimaryClass extends StatefulWidget {
  final String name;
  final String description;

  ///
  ///TODO: COLOR THEME FOR EACH CLASS
  ///
  PrimaryClass(
    this.name,
    this.description,
  );
  @override
  _PrimaryClassState createState() => _PrimaryClassState();
}

class _PrimaryClassState extends State<PrimaryClass> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height * 1;
    double w = MediaQuery.of(context).size.width * 1;
    double width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    double height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    double aspectRatio = height / width;
    if (aspectRatio > 1.89) {
      height *= 0.95;
      width *= 1.14;
    }

//MAIN CONTROL BUTTON

    void _showDashboard(String title) {
      // flutter defined function
      showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 300),
        context: context,
        transitionBuilder: (context, anim1, anim2, child) {
          return ScaleTransition(
            alignment: Alignment.bottomCenter,
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: anim1,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          );
        },
        pageBuilder: (context, anim1, anim2) {
          // return object of type Dialog
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.only(top: h * 0.65),
            // title: new Text(title),
            content: new Container(
              height: h * 0.2,
              width: w * 0.4,
              child: Column(
                children: [
                  //Top/Middle 2 buttons
                  Container(
                    height: h * 0.10,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //2nd Button
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertPage(
                                    widget: SearchTool(),
                                  );
                                });
                          },
                          onLongPress: () {
                            HapticFeedback.heavyImpact();
                          },
                          child: Container(
                            height: h * 0.08,
                            width: h * 0.085,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff063B63)),
                            child: Icon(
                              Icons.search,
                              size: 31,
                              color: Colors.greenAccent,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.05,
                        ),
                        //Third
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onLongPress: () {
                            HapticFeedback.heavyImpact();
                          },
                          child: Container(
                            height: h * 0.08,
                            width: h * 0.085,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff063B63)),
                            child: Icon(
                              Icons.headset_mic,
                              size: 31,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //BottomRow 1 and 4
                  Container(
                    height: h * 0.1,
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
                            HapticFeedback.heavyImpact();
                          },
                          child: Container(
                            height: h * 0.08,
                            width: h * 0.085,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff063B63)),
                            child: Icon(
                              Icons.add_circle_outline,
                              size: 31,
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.2,
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
                            Navigator.of(context)
                                .popUntil(ModalRoute.withName("/"));
                          },
                          onLongPress: () {
                            HapticFeedback.heavyImpact();
                          },
                          child: Container(
                            height: h * 0.08,
                            width: h * 0.085,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff063B63)),
                            child: Icon(
                              Icons.home,
                              size: 31,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return ColorfulSafeArea(
      color: dgray,
      child: DefaultTabController(
        length: 2,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(

              //Right side Drawer
              endDrawer: Drawer(
                child: Container(
                  //Color of background of the drawer
                  //LATER: GET FUNCTION FOR COLOR THEME OF EACH
                  color: black,

                  //Drawer components
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: width * 0.03, vertical: height * 0.005),
                        width: width * 0.05,
                        height: height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(ucla), fit: BoxFit.cover)),
                      ),
                      DrawerTile(
                        body: "",
                        title: "About",
                        icon: Icon(Icons.dashboard),
                      ),
                      DrawerTile(
                        body: "",
                        title: "Events",
                        icon: Icon(
                          Icons.data_usage,
                          color: Colors.red,
                        ),
                      ),
                      DrawerTile(
                        body: "",
                        title: "Contact",
                        icon: Icon(
                          Icons.message,
                          color: Colors.greenAccent,
                        ),
                      ),
                      DrawerTile(
                        body: "",
                        title: "Directors",
                        icon: Icon(
                          Icons.message,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              appBar: AppBar(
                backgroundColor: dgray,
                title: Text("UCLA"),
                actions: [],
              ),
              floatingActionButton: Padding(
                padding: EdgeInsets.only(top: 0, bottom: height * 0.00),
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
                          border: Border.all(color: alexaYellow, width: 2),
                          shape: BoxShape.circle,
                          color: black),
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
                  FloatingActionButtonLocation.miniCenterDocked,
              backgroundColor: dgray,
              bottomNavigationBar: Theme(
                data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent),
                child: TabBar(
                  labelColor: alexaYellow,
                  unselectedLabelColor: Colors.white,
                  /*
                  indicator: BoxDecoration(
                      color: alexaYellow.withAlpha(30),
                      borderRadius: BorderRadius.circular(40)),
                      */
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 0.1,
                  tabs: [
                    Tab(
                      child: Text("Rooms"),
                    ),
                    Tab(
                      child: Text("About"),
                    ),
                  ],
                ),
              ),

              ///Body of Tab Bar
              ///
              body: TabBarView(children: [
                RoomTab(),
                ClassHomeTab(),
              ]));
        }),
      ),
    );
  }
}
