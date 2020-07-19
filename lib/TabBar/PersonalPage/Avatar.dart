import 'dart:ffi';

import 'package:rende/constants.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Color border;
  AssetImage picture;
  bool pad;
  double size;
  Function pressed;

  Avatar({this.border, this.picture, this.size, this.pressed});

  double _size() {
    if (size == null) {
      return 52.0;
    } else
      return size;
  }

  Color _border() {
    if (border == null) {
      return Colors.transparent;
    } else
      return border;
  }

  AssetImage _picture() {
    if (picture == null) {
      return AssetImage(tesla);
    } else
      return picture;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: _size() + 2,
      backgroundColor: _border(),
      child: CircleAvatar(
        radius: _size(),
        backgroundImage: _picture(),

        ///TODO
        ///ON PRESS CHANGE PICTURE
      ),
    );
  }
}
