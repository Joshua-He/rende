import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';

//SIGN UP FORM INPUT
getSignUpData(String info) async {
  var url = 'http://192.168.1.202:3000/customers/signup';
  Map<String, String> headers = {"Content-type": "application/json"};

  //{"account_name": "aname", "last_name": "user07", "first_name": "user07", "password": "password07"}
  String json = info;
  Response response = await post(url, headers: headers, body: json);
  int code = response.statusCode;

  // 200: success
  if (code == 200) {
    print("Sign Up Successful");
  }
  // 404: account already exist
  if (code == 404) {
    print("Username already exists");
  }
  // 500: server internal error
  if (code > 405) {
    print("Unknown Error");
  }

  String body = response.body;
  print(body);
}

login(String info) async {
  var url = 'http://192.168.1.202:3000/customers/login';
  Map<String, String> headers = {"Content-type": "application/json"};

  //{"account_name": "aname", "last_name": "user07", "first_name": "user07", "password": "password07"}
  String json = info;
  Response response = await post(url, headers: headers, body: json);
  int code = response.statusCode;

  // 200: success
  if (code == 200) {
    print("Log In Success");
  }
  // 404: account already exist
  if (code == 404) {
    print("Account Not Found");
  }
  // 500: server internal error
  if (code > 405) {
    print("Unknown Error");
  }

  String body = response.body;
  print(body);
}
