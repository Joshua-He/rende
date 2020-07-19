/*
new bottom bar

void _showDashboard(String title) {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.only(top: height * 0.0),
            // title: new Text(title),
            content: new Container(
              color: Colors.red,
              height: height * 0.26,
              width: width * 0.28,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        //Top/Middle 2 buttons
                        Container(
                          height: h * 0.1,
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
                                  print("d");
                                  HapticFeedback.heavyImpact();
                                },
                                child: Container(
                                  height: h * 0.08,
                                  width: h * 0.085,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff063B63)),
                                  child: Icon(
                                    Icons.headset,
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
                                  print("d");
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
                                    size: 35,
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
                                  print("d");
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
                                width: w * 0.3,
                              ),

                              ///
                              ///
                              ///4th Wheel Button
                              ///
                              ///TODO CREATE SCREEN
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onLongPress: () {
                                  print("d");
                                  HapticFeedback.heavyImpact();
                                },
                                child: Container(
                                  height: h * 0.08,
                                  width: h * 0.085,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff063B63)),
                                  child: Icon(
                                    Icons.chat_bubble_outline,
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
                  )
                ],
              ),
            ),
          );
        },
      );
    }
*/

/*

old

 void _showDashboard(String title) {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.only(top: h * 0.68),
            // title: new Text(title),
            content: new Container(
              height: h * 0.2,
              width: w * 0.4,
              child: Column(
                children: [
                  //Top/Middle 2 buttons
                  Container(
                    height: h * 0.1,
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
                            print("d");
                            HapticFeedback.heavyImpact();
                          },
                          child: Container(
                            height: h * 0.08,
                            width: h * 0.085,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff063B63)),
                            child: Icon(
                              Icons.headset,
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
                            print("d");
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
                              size: 35,
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
                            print("d");
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
                          onLongPress: () {
                            print("d");
                            HapticFeedback.heavyImpact();
                          },
                          child: Container(
                            height: h * 0.08,
                            width: h * 0.085,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff063B63)),
                            child: Icon(
                              Icons.chat_bubble_outline,
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
*/

/*
RoomCard right side

Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.014),
                      height: height * 0.026,
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          RoomTag(color: Colors.red, name: "Serious"),
                          RoomTag(color: Colors.blue, name: "Funny"),
                          RoomTag(color: Colors.amber, name: "Studying"),
                          RoomTag(color: Colors.green, name: "Relaxed"),
                        ],
                      ))),

                      */

///Call
///
///
///
/*
              //All People In The Call
              Positioned(
                child: ListView.builder(
                    itemCount: allStreams.length,
                    itemBuilder: (BuildContext context, int index) {
                      return (mainStream != null &&
                              allStreams[index].getId() != mainStream.getId())
                          ? Container(
                              padding: EdgeInsets.only(bottom: 12.0),
                              height:
                                  MediaQuery.of(context).size.width * 0.3 * 1.3,
                              child: GestureDetector(
                                onTap: () {
                                  /*
                                  setState(() {
                                    mainStream = allStreams[index];
                                  });
                                  */
                                },
                                child: Container(
                                    // child: (allStreams[index] != null && allStreams[index].isPlaying()) ? RTCVideoView(allStreams[index].render) : null,
                                    child: Stack(children: <Widget>[
                                      Container(
                                          child: (allStreams[index] != null &&
                                                  allStreams[index].isPlaying())
                                              ? AgoraVideoView(
                                                  allStreams[index])
                                              : null),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          allStreams[index].getId().toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ]),
                                    decoration:
                                        BoxDecoration(color: Colors.black12)),
                              ))
                          : Container();
                    }),
                right: 16.0,
                top: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.9,
              ),
              */
