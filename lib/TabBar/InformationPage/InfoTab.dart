import 'package:rende/SmallComponents/TextBlock.dart';
import 'package:rende/SmallComponents/TextRow.dart';
import 'package:flutter/material.dart';

class InfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.red,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(top: size.height * 0.08),
          decoration: BoxDecoration(),
          child: Column(
            children: [
              HeaderRow(
                headertext: "About",
              ),
              TextBlock(
                top: 20,
                bottom: 20,
                left: 40,
                right: 40,
                body: "dasdashduiashduiashduiashidashuidhadasuidhasiudiuhas",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
