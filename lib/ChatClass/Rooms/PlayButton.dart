import 'package:flutter/material.dart';
import 'package:rende/constants.dart';

class PlayButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final String name;
  final Function pressed;

  PlayButton({this.icon, this.color, this.name, this.pressed});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: new BorderRadius.circular(80)),
      height: size.width * 0.15,
      width: size.width * 0.155,
      child: InkWell(
        onTap: pressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.005,
            ),
            icon,
            SizedBox(
              height: size.height * 0.001,
            ),
            /*
            Text(
              name,
              style: TextStyle(
                  color: offw, fontSize: 12, fontWeight: FontWeight.w300),
            ),
            */
          ],
        ),
      ),
    );
  }
}
