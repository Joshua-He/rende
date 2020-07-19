import 'package:flutter/material.dart';
import 'package:rende/ChatClass/Class.dart';

class User {
  ///
  ///Needed
  ///
  ///Friends
  ///Added Topics
  String first, last, email, username, phone, password;
  String uid;
  List<PrimaryClass> recentTopics;

  User({
    this.uid,
    this.first,
    this.last,
    this.email,
    this.username,
    this.phone,
    this.password,
  });

  String getFirst() {
    return this.first;
  }

  String getLast() {
    return this.last;
  }

  String getEmail() {
    return this.email;
  }

  String getUsername() {
    return this.username;
  }

  String getUID() {
    return this.uid;
  }
}
