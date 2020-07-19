import 'package:rende/TabBar/PersonalPage/Avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.04,
                ),

                //Go back to prev screen
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Icon(
                        Icons.arrow_back,
                        size: 26,
                      ),
                    ],
                  ),
                ),

                divide(20, 20),

                InkWell(
                  onTap: () {
                    //Change Avatar
                  },
                  child: Avatar(),
                ),

                divide(15, 20),

                Row(
                  children: [
                    divide(10, 10),
                    Text(
                      "Username",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    divide(0, size.width * 0.33),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),

                divide(15, 20),

                //Second
                Row(
                  children: [
                    divide(10, 10),
                    Icon(Icons.phone),
                    divide(0, 4),
                    Text(
                      "Phone #",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    divide(0, size.width * 0.30),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                divide(15, 20),

                Row(
                  children: [
                    divide(10, 10),
                    Text(
                      "Something",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    divide(0, size.width * 0.33),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                divide(15, 20),

                Row(
                  children: [
                    divide(10, 10),
                    Text(
                      "Testing1",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    divide(0, size.width * 0.33),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                divide(15, 20),

                Row(
                  children: [
                    divide(10, 10),
                    Text(
                      "Phone #",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    divide(0, size.width * 0.33),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                divide(15, 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Padding divide(double top, double side) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: side, vertical: top),
    child: Divider(
      thickness: 1.5,
    ),
  );
}
