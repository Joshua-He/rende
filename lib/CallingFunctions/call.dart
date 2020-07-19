import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:agora_flutter_webrtc/agora_flutter_webrtc.dart';
import 'package:rende/TabBar/PersonalPage/Avatar.dart';
import 'package:rende/TabBar/tabbar.dart';
import 'package:rende/constants.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

class CallPage extends StatefulWidget {
  final String channel;
  final bool video;
  final bool audio;
  final bool screen;
  final String appId;
  final String profile;
  final String width;
  final String height;
  final String framerate;
  final String codec;
  final String mode;

  CallPage({
    this.appId,
    this.channel,
    this.video,
    this.audio,
    this.screen,
    this.profile,
    this.width,
    this.height,
    this.framerate,
    this.codec,
    this.mode,
  });

  @override
  CallPageState createState() {
    return new CallPageState(
      appId: appId,
      channel: channel,
      video: video,
      audio: audio,
      screen: screen,
      profile: profile,
      width: width,
      height: height,
      framerate: framerate,
      codec: codec,
      mode: mode,
    );
  }
}

class CallPageState extends State<CallPage> {
  String appId;
  String channel;
  bool video;
  bool audio;
  bool screen;
  String profile;
  String width;
  String height;
  String framerate;
  String codec;
  String mode;
  bool videoOn;
  bool disableButton;

  AgoraClient agoraClient;
  AgoraClient shareScreenClient;

  AgoraStream mainStream;
  AgoraStream shareScreenStream;

  List<AgoraStream> remoteStreams;
  List<AgoraStream> localStreams;
  List<AgoraStream> allStreams;
  List<Timer> timers = new List<Timer>();

  Map<String, String> mediaStats;

  CallPageState({
    this.appId,
    this.channel,
    this.video,
    this.audio,
    this.screen,
    this.profile,
    this.width,
    this.height,
    this.framerate,
    this.codec,
    this.mode,
  });

  ///
  ///

  ///
  ///
  void startShareScreen(String cname) async {
    shareScreenClient = AgoraClient(appId: appId, mode: mode, codec: codec);

    await shareScreenClient.join(null, cname, 1);
    shareScreenStream = AgoraStream.createStream(
        {'audio': true, 'video': false, 'screen': true});

    try {
      await shareScreenStream.init();
    } catch (e) {}

    await shareScreenClient.publish(shareScreenStream);
    localStreams.add(shareScreenStream);
  }

  void stopShareScreen() async {
    await shareScreenClient?.leave();
    shareScreenClient = null;
    shareScreenStream?.close();
  }

  void initState() {
    super.initState();

    print(
        "$channel,$video,$audio,$screen,$profile,$width,$height,$framerate,$codec,$mode");

    localStreams = new List<AgoraStream>();
    remoteStreams = new List<AgoraStream>();
    allStreams = new List<AgoraStream>();

    agoraClient = AgoraClient(appId: appId, mode: mode, codec: codec);
    agoraClient.on("peer-leave", (evt) async {
      var uid = evt["uid"];
      var stream = remoteStreams.firstWhere((AgoraStream stream) {
        return stream.getId() == uid;
      }, orElse: () {});

      if (stream == null) {
        return;
      }
      setState(() {
        remoteStreams.remove(stream);
        allStreams.remove(stream);
      });
    });

    agoraClient.on("connection-state-change", (evt) async {
      print("state change from ${evt['prvState']} to ${evt['curState']}");
    });

    agoraClient.on("stream-removed", (evt) async {
      var stream = evt["stream"];
      setState(() {
        remoteStreams.remove(stream);
        allStreams.remove(stream);
      });
    });

    agoraClient.on("stream-added", (evt) async {
      var stream = evt["stream"];
      await agoraClient.subscribe(stream);
      remoteStreams.add(stream);
      // id=1 means this stream is sharing screen stream
      if (stream.getId() == 1) {
        await stream.play(mode: "contain");
      } else {
        await stream.play();
      }
      setState(() {
        allStreams.add(stream);
      });
    });

    ///join
    ///
    ///
    agoraClient.join(null, channel, 0).then((uid) async {
      AgoraStream stream = AgoraStream.createStream(
          {'audio': audio, 'video': video, 'screen': screen});

      if (width != "" && height != "" && framerate != "") {
        stream.setVideoResolution(int.parse(width), int.parse(height));
        stream.setVideoFrameRate(int.parse(framerate));
      } else {
        stream.setVideoProfile(profile);
      }

      await stream.init();
      localStreams.add(stream);
      await stream.play();
      setState(() {
        mainStream = stream;

        mainStream.muteVideo();
        allStreams.add(stream);
      });
      return stream;
    }).then((stream) async {
      await agoraClient.publish(stream);
    });
    ////
    ///
    ///
    ///
    ///

    var timer = Timer.periodic(new Duration(seconds: 1), (_) {
      setState(() {
        // mediaStats = mainStream?.getStats();
      });
    });
    timers.add(timer);

    ///My Variables
    ///
    ///
    videoOn = true;
    disableButton = true;
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        disableButton = false;
      });
    });
  }

  void dispose() {
    localStreams?.forEach((AgoraStream stream) {
      stream?.close();
    });
    remoteStreams?.forEach((AgoraStream stream) {
      stream?.close();
    });
    allStreams?.forEach((AgoraStream stream) {
      stream?.close();
    });
    timers?.forEach((Timer timer) {
      timer.cancel();
    });

    localStreams = [];
    remoteStreams = [];
    allStreams = [];
    timers = [];
    super.dispose();
    stopShareScreen();
    agoraClient.leave();
    agoraClient = null;
  }

  ///My functions
  ///
  ///
  void closeStream() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TabBarDemo()));

    dispose();
  }

  void _slideDialog() {
    slideDialog.showSlideDialog(
      context: context,
      child: Text("Hello World"),
      barrierColor: Colors.black.withOpacity(0.1),
      pillColor: Colors.red,
      backgroundColor: Colors.yellow,
    );
  }

  @override
  Widget build(BuildContext context) {
    /*
    if (videoOn == true && mainStream.isPlaying() == true) {
      mainStream.muteVideo();
      print(videoOn);
      videoOn = false;
    }
    */
    double width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    double height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    double aspectRatio = height / width;
    if (aspectRatio > 2.05) {
      height *= 0.9;
      width *= 1.2;
    } else if (aspectRatio < 2.05 && aspectRatio > 1.9) {
      height *= 0.95;
      width *= 1.1;
    } else if (aspectRatio < 2 && aspectRatio > 1.85) {
      height *= 0.95;
      width *= 1.05;
    } else {
      width *= 1.01;
    }

    ///
    ///
    ///Functions

    void dialog(BuildContext context) {
      showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 370),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.25,
              child: SizedBox.expand(child: FlutterLogo()),
              margin: EdgeInsets.only(bottom: height * 0.01, left: 5, right: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
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

    ///
    ///
    print("Call IS ACTIVE");
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        /*
            appBar: AppBar(
              title: Text('In Call'),
            ),
            */
        body: new Dismissible(
          key: Key("Username"),
          onDismissed: (_) {
            Navigator.pushNamed(context, '/call');
          },
          direction: DismissDirection.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                //Main Video View
                Positioned(
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: (mainStream != null && mainStream.isPlaying())
                          ? AgoraVideoView(mainStream)
                          : Container(
                              decoration: BoxDecoration(
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
                                ]),
                              ),
                            ),
                      decoration: BoxDecoration(color: Colors.black54),
                    );
                  }),
                  left: 0,
                  top: 0,
                ),
                //Grid View of Profiles
                Container(
                  margin: EdgeInsets.only(
                      left: width * 0.01,
                      right: width * 0.01,
                      top: height * 0.02,
                      bottom: height * 0.08),
                  child: GridView.builder(

                      ///
                      ///DYNAMIC LIST FOR MODERATORS OF A ROOM
                      ///
                      itemCount: 10, //allStreams.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 6,
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        //LIST OF ITEMS BY INDEX
                        return Avatar(
                          picture: AssetImage(facebook),
                          size: 70,
                        );
                      }),
                ),
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

                ///
                ///
                ///Button Bar

                Positioned(
                  child: Container(
                    margin: EdgeInsets.only(bottom: height * 0.045 - 10),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        /// Switch Camera
                        /*
                              mainStream.isLocal == true
                                  ? IconButton(
                                      icon: Icon(
                                        Icons.switch_camera,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      tooltip: "switch camera",
                                      onPressed: () {
                                        //POP THE CHAT
                                        mainStream.switchDevice();
                                      },
                                    )
                                  : Container(),
                                  */

                        //Screen Share

                        /*
                               IconButton(
                                 icon: shareScreenStream == null
                                     ? Icon(Icons.screen_share, color: Colors.white)
                                     : Icon(Icons.stop_screen_share,
                                         color: Colors.white),
                                 tooltip: shareScreenStream == null
                                     ? 'start sharing screen'
                                     : 'stop sharing screen',
                                 onPressed: () {
                                   if (shareScreenStream == null) {
                                     startShareScreen(channel);
                                   } else {
                                     stopShareScreen();
                                     setState(() {
                                       shareScreenStream = null;
                                     });
                                   }
                                 },
                               ),
                               */

                        //AUDIO MUTING

                        Container(
                          margin: EdgeInsets.only(
                              left: width * 0.01, right: width * 0.01),
                          height: height * 0.024,
                          width: height * 0.024,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Colors.blueAccent.withOpacity(0.8)),
                          child: IconButton(
                            icon:
                                (mainStream != null) && mainStream.isAudioMuted
                                    ? Icon(
                                        Icons.volume_off,
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    : Icon(
                                        Icons.volume_up,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                            tooltip:
                                (mainStream != null) && mainStream.isAudioMuted
                                    ? 'Unmute Audio'
                                    : 'Mute Audio',
                            onPressed: () {
                              if ((mainStream != null) &&
                                  mainStream.isAudioMuted) {
                                setState(() {
                                  mainStream.unmuteAudio();
                                });
                              } else {
                                setState(() {
                                  mainStream.muteAudio();
                                });
                              }
                            },
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            if (disableButton == false) {
                              closeStream();
                            } else
                              print("Not active");
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: width * 0.01, right: width * 0.01),
                            height: height * 0.024,
                            width: height * 0.024,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.redAccent),
                            child: Icon(
                              Icons.call_missed_outgoing,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            _slideDialog();
                            /*
                            agoraClient.leave();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TabBarDemo())); */
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: width * 0.01, right: width * 0.01),
                            height: height * 0.024,
                            width: height * 0.024,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.greenAccent),
                            child: Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  left: 0,
                  bottom: 0,
                ),

                /*
                Positioned(
                  child: (mainStream != null && mediaStats != null)
                      ? ListView.builder(
                          itemCount: mediaStats.length,
                          itemBuilder: (BuildContext context, int index) {
                            var key = mediaStats.keys.elementAt(index);
                            var value = mediaStats[key];
                            return Text("$key: $value",
                                style: TextStyle(color: Colors.white));
                          })
                      : Container(),
                  left: 0,
                  top: 0,
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.5,
                )*/
              ],
            ),
          ),
        ),

        ///
        ///
        ///
        ///MUTE THE PERSON WHEN CLICKED
        endDrawer: Drawer(
          child: Container(
              // color: Colors.red,
              child: ListView.builder(
                  itemCount: remoteStreams.length,
                  itemBuilder: (BuildContext context, int index) {
                    var stream = remoteStreams[index];
                    return Container(
                        child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(stream.getId().toString()),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: stream.isAudioMuted
                                    ? Icon(Icons.volume_off)
                                    : Icon(Icons.volume_up),
                                tooltip: stream.isAudioMuted
                                    ? 'unmute audio'
                                    : 'mute audio',
                                onPressed: () {
                                  if (stream.isAudioMuted) {
                                    setState(() {
                                      stream.unmuteAudio();
                                    });
                                  } else {
                                    setState(() {
                                      stream.muteAudio();
                                    });
                                  }
                                },
                              ),
                              IconButton(
                                icon: stream.isVideoMuted
                                    ? Icon(Icons.videocam_off)
                                    : Icon(Icons.videocam),
                                tooltip: stream.isVideoMuted
                                    ? 'unmute video'
                                    : 'mute video',
                                onPressed: () {
                                  print(stream.getId());
                                  if (stream.isVideoMuted) {
                                    setState(() {
                                      stream.unmuteVideo();
                                    });
                                  } else {
                                    setState(() {
                                      stream.muteVideo();
                                    });
                                  }
                                },
                              ),
                              FlatButton(
                                color: Colors.blue,
                                textColor: Colors.white,
                                onPressed: () async {
                                  if (stream.hasSubscribed) {
                                    await agoraClient.unsubscribe(stream);
                                    setState(() {
                                      allStreams.remove(stream);
                                    });
                                  } else {
                                    await agoraClient.subscribe(stream);
                                    if (stream.getId() == 1) {
                                      await stream.play(mode: "contain");
                                    } else {
                                      await stream.play();
                                    }
                                    setState(() {
                                      allStreams.add(stream);
                                    });
                                  }
                                },
                                child: Text(
                                  stream.hasSubscribed ? "unsub" : "sub",
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ));
                  })),
        ),
      ),
    );
  }
}
