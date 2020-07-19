import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rende/LargeComponents/AlertPage.dart';
import 'package:rende/SmallComponents/ActionButton.dart';
import 'package:rende/SmallComponents/CardWrap.dart';
import 'package:rende/SmallComponents/InfoButton.dart';
import 'package:rende/SmallComponents/LineWithText.dart';
import 'package:rende/SmallComponents/Tags/Tags.dart';
import 'package:rende/SmallComponents/TextBlock.dart';
import 'package:rende/SmallComponents/TextRow.dart';
import 'package:rende/TabBar/PersonalPage/Avatar.dart';
import 'package:rende/TabBar/Search/SearchRoom.dart';
import 'package:rende/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassHomeTab extends StatelessWidget {
  bool test = true;
  final List<HeaderRow> testing = [
    HeaderRow(
      headertext: 'GridTest',
      color: white1,
    ),
    HeaderRow(
      headertext: 'GridTest',
      color: white1,
    ),
    HeaderRow(
      headertext: 'GridTest',
      color: white1,
    ),
    HeaderRow(
      headertext: 'GridTest',
      color: white1,
    ),
    HeaderRow(
      headertext: 'GridTest',
      color: white1,
    ),
    HeaderRow(
      headertext: 'GridTest',
      color: white1,
    ),
    HeaderRow(
      headertext: 'GridTest',
      color: white1,
    ),
    HeaderRow(
      headertext: 'GridTest',
      color: white1,
    ),
    HeaderRow(
      headertext: 'GridTest',
      color: white1,
    ),
    HeaderRow(
      headertext: 'GridTest',
      color: white1,
    ),
    HeaderRow(
      headertext: 'GridTest',
      color: white1,
    ),
    HeaderRow(
      headertext: 'GridTest',
      color: white1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //Orientation of SCREEN
    final orientation = MediaQuery.of(context).orientation;
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
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.00, vertical: height * 0.00),
      //Color of background of this tab
      //LATER: SET COLOR BASED ON THEME
      //color: primaryColor.withOpacity(0.95),
      decoration: BoxDecoration(
        color: CupertinoColors.darkBackgroundGray,
        /*
          gradient: LinearGradient(
        colors: [Color(0xfd28313B), Color(0xfd487061)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )*/
      ),

      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height * 0.08,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    image: DecorationImage(
                        image: AssetImage(ucla), fit: BoxFit.fill),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: height * 0.045, left: width * 0),
                      height: height * 0.05,
                      child: Avatar(
                        picture: AssetImage(zuck),
                      ),
                    ),
                  ],
                ),
                //Top Row UCLA + JOIN
                Container(
                  margin: EdgeInsets.only(
                    top: height * 0.094,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeaderRow(
                        headertext: "UCLA Bruins",
                        color: white1,
                      ),

                      ///
                      /// Users Added Contains (this class)
                      /// ? Icons ADDED : Icons ADD
                      /*
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: alexaYellow, width: 1.6)),
                        child: InkWell(
                          onTap: () {
                            test = !test;
                            print(test);
                          },
                          //Button Appearance IF TRUE AND IF NOT TRUE
                          child: test == true
                              ? Container(
                                  width: width * 0.05,
                                  height: height * 0.009,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 20,
                                        color: alexaYellow,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: width * 0.00),
                                        child: Text(
                                          "JOIN",
                                          style: TextStyle(color: alexaYellow),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6)),
                                  width: width * 0.05,
                                  height: height * 0.009,
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      color: white1,
                                      size: 18,
                                    ),
                                  ),
                                ),
                        ),
                      ),


                      */
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.02),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: new BorderRadius.circular(6)),
                child: TextBlock(
                  color: Colors.amber,
                  body:
                      "UCLA is a college located in Los Angeles, California. Ranked the number one public university in the United States, UCLA naturally is better than UC Berkeley 😀 😃 😄 😁 😆 😅 😂 🤣 😵 🤐 🥴 🤢 🤮 🤧 😷 🤒 🤕 🤑 🤠 😈 👿 👹 👺 🤡 💩 👻 💀 ☠️ 👽 👾 🤖 🎃 😺 😸 😹 😻 😼 😽 🙀 😿 😾",
                  top: 7,
                  bottom: 7,
                  left: 16,
                  right: 10,
                ),
              ),
            ),

            LineWithText(
              text: "Tags",
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.01, vertical: height * 0.008),
              child: Wrap(
                children: [
                  Tag(
                    color: Colors.green,
                    name: "Learn",
                  ),
                  Tag(
                    name: "Schools",
                    color: Colors.red,
                  ),
                  Tag(
                    name: "DJSA",
                    color: Colors.grey,
                  ),
                  Tag(
                    name: "Cal",
                    color: Colors.lightBlue,
                  ),
                  Tag(
                    name: "Bears",
                    color: Colors.amber,
                  ),
                ],
              ),
            ),

            ///Section

            LineWithText(
              text: "Offers",
              textColor: alexaYellow,
              lineColor: alexaYellow,
            ),

            ///Section
            ///
            Container(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              height: size.height * 0.3,
              child: GridView.builder(

                  ///
                  ///DYNAMIC LIST FOR MODERATORS OF A ROOM
                  ///
                  itemCount: testing.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 2 : 3),
                  itemBuilder: (BuildContext context, int index) {
                    //LIST OF ITEMS BY INDEX
                    return Container(
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: new BorderRadius.circular(6)),
                        child: testing[index]);
                  }),
            ),

            Divider(
              thickness: 1.6,
              color: offwd.withOpacity(0.4),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            HeaderRow(
              headertext: "About",
              color: Colors.blueAccent.withOpacity(0.9),
            ),
            CardWrap(
              child: TextBlock(
                color: Colors.amber,
                body:
                    "UCLA is a college located in Los Angeles, California. Ranked the number one public university in the United States, UCLA naturally is better than UC Berkeley",
                top: 4,
                bottom: 4,
                left: 10,
                right: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
