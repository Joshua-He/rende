import 'package:rende/ItemCards/CategoryList.dart';
import 'package:rende/ItemCards/ItemCard.dart';
import 'package:rende/ItemCards/ItemList.dart';
import 'package:rende/LargeComponents/CardPageView.dart';

import 'package:rende/SmallComponents/LineWithText.dart';
import 'package:rende/SmallComponents/TextRow.dart';
import 'package:rende/TabBar/Search/SearchRoom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rende/constants.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    //final _scrollController1 = ScrollController();
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    double height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    double aspectRatio = height / width;
    if (aspectRatio > 2.05) {
      height *= 0.95;
      width *= 1.17;
    } else if (aspectRatio < 2.05 && aspectRatio > 1.9) {
      height *= 0.94;
      width *= 1.01;
    } else if (aspectRatio < 2 && aspectRatio > 1.85) {
      height *= 0.95;
      width *= 1.05;
    } else {
      width *= 1.01;
    }

    //

    List test = [
      Container(
        margin: EdgeInsets.only(left: width * 0.015, right: width * 0.006),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(google), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
        ),
        //  border: Border.all(width: 2.5, color: _color())),
      ),
      Container(
        margin: EdgeInsets.only(left: width * 0.015, right: width * 0.006),
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(facebook), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
        ),
        //  border: Border.all(width: 2.5, color: _color())),
      ),
      Container(
        margin: EdgeInsets.only(left: width * 0.015, right: width * 0.006),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(twitter), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
        ),
        //  border: Border.all(width: 2.5, color: _color())),
      ),
      Container(
        margin: EdgeInsets.only(left: width * 0.015, right: width * 0.006),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(tesla), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
        ),
        //  border: Border.all(width: 2.5, color: _color())),
      ),
    ];

    //
    return Container(
      //Change the color of the background of the tab

      padding: EdgeInsets.only(
          top: size.height * 0.04, left: width * 0.002, right: width * 0.00),
      margin: EdgeInsets.only(),
      //Change the color of the background of the tab
      decoration: BoxDecoration(
        color: Colors.black,
        //image: DecorationImage(image: AssetImage(logo2), scale: 1),
/*
        gradient: RadialGradient(colors: [
          dgray,
          alexaYellow.withAlpha(60),
          alexaContrast,
          Colors.black
        ], stops: [
          0.2,
          0.45,
          0.5,
          0.6
        ]), */
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              //First TITLE FINANCE
              Container(
                margin: EdgeInsets.only(left: width * 0.012),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(6)),
                        child: Text(
                          "Finance",
                          style: TextStyle(
                              color: Colors.greenAccent, fontSize: 30),
                        ),
                      ),
                    ),

                    ///Spacer
                    Container(
                      width: width * 0.13,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      width: width * 0.056,
                      height: height * 0.011,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: alexaYellow, width: 1.6)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: width * 0.00),
                            child: Text(
                              "See More",
                              style: TextStyle(color: alexaYellow),
                            ),
                          )
                        ],
                      ),
                    ),

                    ///Icon
                    ///
                    /*
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: new BorderRadius.circular(6)),
                      child: Icon(
                        Icons.attach_money,
                        size: 26,
                        color: Colors.black,
                      ),
                    ),
                    */
                  ],
                ),
              ),

              ItemList(
                title: "Testing",
              ),
              Container(
                margin:
                    EdgeInsets.only(top: height * 0.01, bottom: height * 0.003),
                child: LineWithText(
                  text: "Topics",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                child: CategoryList(
                  title: "Testing",
                ),
              ),

              Container(
                height: height * 0.12,
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.007,
                  vertical: height * 0.01,
                ),
                child: CardPageView(
                  itemList: test,
                ),
              ),
              HeaderRow(
                headertext: "Technology",
                color: Colors.white,
              ),
              Scrollbar(
                child: ItemList(
                  title: "Testing",
                ),
              ),

              Container(
                height: 700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
