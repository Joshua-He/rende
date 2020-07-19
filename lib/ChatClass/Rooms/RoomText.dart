import 'package:flutter/material.dart';
import 'package:rende/SmallComponents/CardWrap.dart';
import 'package:rende/SmallComponents/TextBlockLimit.dart';

class RoomText extends StatelessWidget {
  final String desc;
  final Function pressed;
  final bool expand;
  final bool color;
  final double size;
  RoomText({this.desc, this.pressed, this.expand, this.color, this.size});

  Color _color() {
    if (color == true) {
      return Colors.white10.withOpacity(0.1);
    } else
      return Colors.transparent;
  }

  double _size() {
    if (size == null) {
      return 16;
    } else
      return size;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CardWrap(
      color: _color(),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 14),
      insidePadding: EdgeInsets.symmetric(vertical: 6, horizontal: 3),
      child: InkWell(
        onTap: pressed,
        child: TextBlockLimit(
          //IF Expand is true, then limit is false, if expand is false, then don't limit
          limit: !expand,
          body: desc,
          fsize: _size(),
          top: 0,
          bottom: 0,
          left: size.width * 0.00,
          right: size.width * 0.03,
          weight: FontWeight.w400,
        ),
      ),
    ); //End Text Block
  }
}
