import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rende/ChatClass/Rooms/RoomCard.dart';
import 'package:rende/constants.dart';

///GridView Builder for the layout of the room
///
///GridView Reads from DB of Rooms

class RoomTab extends StatelessWidget {
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
      //Color
      decoration: BoxDecoration(
        color: dgray,
        /*
          gradient: LinearGradient(
        colors: [Color(0xfd28313B), Color(0xfd485461)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )*/
      ),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoomCard(
            title: "Computer Science",
            titleColor: Colors.lightBlueAccent,
            description:
                "We are studying for CS143. Working through some of the worksheets and final review. dsahiodsiodjiasjdioasjdoiasjiodasijdjsaijdiasjdioasjiodajioasjdioasjdjsiaodjiosdjisodoisjdjiosjdoisjdiosdjisojdiosjiodJoin!",
          ),
          RoomCard(
            title: "Physics",
            backgroundColor: Colors.black38,
            description: "This is the physics",
          ),
          RoomCard(
            title: "Biology",
            backgroundColor: CupertinoColors.destructiveRed.withAlpha(100),
            description: "This is the biology group",
          ),
          RoomCard(
            title: "Computer Science",
            titleColor: Colors.lightBlueAccent,
            description:
                "This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group.This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group.This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group.This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group.This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group.This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group. This is the comp sci group.",
          ),
          RoomCard(
            title: "Physisscs",
            description: "This is the physics",
          ),
          RoomCard(
            title: "Biology",
            description: "This is the biology group",
          )
        ],
      )),
    );
  }
}
