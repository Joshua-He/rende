import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rende/SmallComponents/TextRow.dart';
import 'package:rende/TabBar/tabbar.dart';
import 'package:rende/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child:
          //Color of top system icon bar
          ColorfulSafeArea(
              color: Colors.black87,
              top: false,
              child: Stack(
                children: [
                  new TabBarDemo(),
                ],
              )),
    );
  }
}
