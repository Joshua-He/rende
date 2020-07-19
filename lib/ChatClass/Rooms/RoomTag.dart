import 'package:flutter/material.dart';
import 'package:rende/constants.dart';

///Add BackgroundImage for Tag
///
class RoomTag extends StatelessWidget {
  final String name;
  final Color color;
  final Function pressed;
  const RoomTag({Key key, this.name, this.color, this.pressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.5),
      child: InkWell(
        onTap: pressed,
        child: Container(
          alignment: Alignment.topLeft,
          height: size.height * 0.057,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
          decoration: BoxDecoration(
              color: color, borderRadius: new BorderRadius.circular(7.0)),
          child: Text(
            name,
            style: TextStyle(
                color: white1, fontSize: 14.6, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
