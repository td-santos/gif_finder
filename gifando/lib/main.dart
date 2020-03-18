import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gifando/HomePage.dart';

main(List<String> args) {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //systemNavigationBarColor: Colors.lightBlue[700], // navigation bar color
    statusBarColor: Colors.black,
    
    statusBarIconBrightness: Brightness.light // status bar color
  ));
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    
  ));
}