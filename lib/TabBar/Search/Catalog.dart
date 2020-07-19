import 'package:rende/ItemCards/SearchCard.dart';
import 'package:rende/constants.dart';
import 'package:flutter/material.dart';

void addItems(List<SearchCard> itemList, BuildContext context) {
  itemList.add(SearchCard(
    title: "tesla",
    desc: "test",
    tags: "car elon musk 420",
    bottomColor: Colors.red,
    imgSrc: tesla,
  ));

  itemList.add(SearchCard(
    title: "Google",
    desc: "Google Internet Search Software",
    bottomColor: Colors.yellow,
    tags: "",
    imgSrc: google,
    pressed: () {},
  ));

  itemList.add(SearchCard(
    title: "Twitter",
    desc: "test",
    tags: "chips semi hardware laptops",
    imgSrc: twitter,
  ));
  itemList.add(SearchCard(
      title: "Facebook",
      desc: "test",
      tags: "tech software xbox",
      imgSrc: facebook));
}

bool checkTags(List<String> tags, String target) {
  for (int i = 0; i < tags.length; i++) {
    if (tags[i].toLowerCase().contains(target.toLowerCase())) {
      print('match');
      return true;
    }
  }

  return false;
}
