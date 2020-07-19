import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rende/CallingFunctions/call.dart';
import 'package:rende/ChatClass/Rooms/PlayButton.dart';
import 'package:rende/ChatClass/Rooms/RoomText.dart';
import 'package:rende/SmallComponents/CardWrap.dart';
import 'package:rende/SmallComponents/TextRow.dart';
import 'package:rende/TabBar/PersonalPage/Avatar.dart';
import 'package:rende/TabBar/Search/SearchRoom.dart';
import 'package:rende/constants.dart';

///Change Layout based on settings
///1 card wide or 2 cards wide
///
///Get Live Avatars of Users to use inside the card
///
///
///Expand to Tags when clicked on
class RoomCard extends StatelessWidget {
  final String parent;
  final String title;
  final String description;
  final RoomText roomDescription;
  final Color titleColor, backgroundColor;

  ///Tag List Constructor
  ///
  ///Number of Speakers
  ///Number of Listener
  ///
  ///Room Owner

  RoomCard(
      {Key key,
      this.title,
      this.description,
      this.parent,
      this.titleColor,
      this.backgroundColor,
      this.roomDescription})
      : super(key: key);

  ///Default Rooms Settings
  ///
  ///
  ///
  ///
  String _title() {
    if (title == null) {
      return parent;
    } else {
      return title;
    }
  }

  Color _titleColor() {
    if (titleColor == null) {
      return white1;
    } else
      return titleColor;
  }

  Color _backgroundColor() {
    if (backgroundColor == null) {
      return Colors.white10.withOpacity(0.05);
    } else
      return backgroundColor;
  }

  ///TESTING DATA
  ///
  ///
  ///

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    double h = size.height * 1;
    double w = size.width * 1;
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
      width *= 1.05;
    } else if (aspectRatio < 2 && aspectRatio > 1.85) {
      height *= 0.95;
      width *= 1.05;
    } else {
      width *= 1.01;
    }

    ///Functions
    ///
    ///CALL FUNCTIons AND VARIABLES
    final _widthController = TextEditingController();
    final _heightController = TextEditingController();
    final _frameRateController = TextEditingController();
    final String _appId = "54f54d18ab7b4164bef21e0ba03558df";
    String _profile = "480p";

    joinRoomAudio() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => new CallPage(
                    appId: appId,
                    channel: title,
                    video: true,
                    audio: true,
                    screen: false,
                    profile: profile,
                    width: _widthController.text,
                    height: _heightController.text,
                    framerate: _frameRateController.text,
                    codec: "h264",
                    mode: "rtc",
                  )));
    }

    joinRoomNoAudio() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => new CallPage(
                    appId: appId,
                    channel: title,
                    video: true,
                    audio: true,
                    screen: false,
                    profile: profile,
                    width: _widthController.text,
                    height: _heightController.text,
                    framerate: _frameRateController.text,
                    codec: "h264",
                    mode: "live",
                  )));
    }

    ///
    ///
    void _showDialog(String title) {
      //SHOW TEXT DESCRIPTION FOR A ROOM
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            backgroundColor: Color(0xff333E47),
            insetPadding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, vertical: size.height * 0.1),
            contentPadding: EdgeInsets.all(0),
            content: Padding(
              padding: EdgeInsets.only(top: size.height * 0.03),
              child: new Container(
                height: size.height * 0.5,
                width: size.width * 1,
                child: SingleChildScrollView(
                    child: RoomText(
                  desc: description,
                  expand: true,
                )),
              ),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: Text("Close",
                    style: TextStyle(color: white1, fontSize: 23)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    void joinChat(BuildContext context) {
      showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 370),
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

    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.000,
          top: size.height * 0.000,
          bottom: size.height * 0.04 + height * 0.002),
      child: InkWell(
        onTap: () {
          print("Outside Layer Presed");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Begin LeftSide
            Container(
              decoration: BoxDecoration(
                  color: _backgroundColor(), //lightener.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              height: height * 0.123,
              width: width * 0.21 + size.width * 0.04,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TITLE ROW
                  // GET TITLE FROM DB
                  Row(
                    children: [
                      SizedBox(
                        height: size.height * 0.06 + height * 0.006,
                      ),
                      HeaderRow(
                        limit: 15,
                        fsize: 28,
                        headertext: title,
                        color: _titleColor(),
                      ),
                    ],
                  ),

                  ///Text block with limit, set this container to a constant size
                  Container(
                    //Bind the height of this textblock
                    height: height * 0.045,
                    width: size.width * 0.43 + width * 0.11,

                    child: RoomText(
                      desc: description,
                      size: 14,
                      expand: false,
                      pressed: () {
                        _showDialog("Room Description");
                      },
                    ),
                  ),

                  ///Avatars of People currently in a given Room
                  ///TODO
                  ///  GET AVATAR OF ALL IN ROOM
                  ///  SEPARATE BY TALKING AND LISTENING
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.00,
                        vertical: size.height * 0.00),
                    child: CardWrap(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.005, horizontal: 14),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ///
                            ///In the Speaking section
                            Icon(
                              Icons.settings_voice,
                              color: white1,
                              size: 30,
                            ),
                            SizedBox(width: size.width * 0.024),

                            Avatar(
                              //Person who create the room has a bigger avatar
                              size: 24,
                              border: Colors.red,
                              pressed: () {
                                print("s");
                              },
                            ),
                            SizedBox(width: size.width * 0.025),
                            Avatar(
                              size: size.height * 0.025,
                              border: Colors.blue,
                            ),
                            SizedBox(width: size.width * 0.025),
                            Avatar(
                              size: size.height * 0.025,
                              border: Colors.yellow,
                            ),
                            SizedBox(width: size.width * 0.025),
                            Avatar(
                              size: size.height * 0.025,
                              border: Colors.green,
                            ),
                            SizedBox(width: size.width * 0.025),
                            Avatar(
                              size: size.height * 0.025,
                            ),
                            SizedBox(width: size.width * 0.025),
                            Avatar(
                              size: size.height * 0.025,
                              border: Colors.purple,
                            ),
                            SizedBox(width: size.width * 0.025),

                            ///Listening into CAll
                            Icon(
                              Icons.headset,
                              color: Colors.white,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              ///End First Card On the left
            ),

            //Right SIDE PANEL
            ///TODO:
            ///Stateful Widgets From DB
            Container(
              decoration: BoxDecoration(
                  //  color: _backgroundColor(), //lightener.withOpacity(0.1),
                  borderRadius: new BorderRadius.circular(12)),
              height: height * 0.12,
              width: width * 0.03 + size.width * 0.07,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                //Top block for functionalities
                ///JOIN CALL JOIN LISTEN
                ///
                ///Second block for tags
                children: [
                  ///
                  ///First Section
                  Container(
                    height: height * 0.12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(),
                          child: PlayButton(
                            icon: Icon(
                              Icons.headset_mic,
                              size: 26,
                              color: Colors.amber,
                            ),
                            color: Colors.transparent,
                            name: "Speak",
                            pressed: () {
                              joinRoomAudio();
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.001),
                          child: PlayButton(
                            icon: Icon(
                              Icons.headset,
                              size: 26,
                              color: CupertinoColors.activeGreen,
                            ),
                            color: Colors.transparent,
                            name: "Listen",
                            pressed: () {
                              print("AUDIO");
                              joinRoomNoAudio();
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: size.height * 0.0),
                          child: PlayButton(
                            icon: Icon(
                              Icons.chat_bubble_outline,
                              size: 26,
                              color: CupertinoColors.systemBlue,
                            ),
                            color: Colors.transparent,
                            name: "Chat",
                            pressed: () {
                              joinChat(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///Second Section
                  ///
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
