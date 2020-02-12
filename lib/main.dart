import 'package:flutter/material.dart';
//import 'package:flutter_app/src/code_1.dart';
//import 'package:flutter_app/src/code_2.dart';
//import 'package:flutter_app/src/code_3.dart';
//import 'package:flutter_app/src/code_4.dart';
import 'package:flutter_app/demo_1//demo.dart';

void main() => runApp(MyApp());

//code_4
class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new MaterialApp(
      locale: Locale('en', 'US'),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primaryColor: Colors.deepOrangeAccent,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor:Colors.white54
      ),
      home: new Demo_1(),
    );
  }
}


// code_1
//class MyApp extends StatelessWidget {
//  @override
//  Widget build (BuildContext context) {
//    return new MaterialApp(
//      title:'Wecome to Flutter',
////    主题更换
//      theme: new ThemeData(
//        primaryColor: Colors.white,
//      ),
////    替换初始build
//      home: new RandomWords(),
//    );
//  }
//}

//code_2
//class MyApp extends StatelessWidget {
//  @override
//  Widget build (BuildContext context) {
//    return new MaterialApp(
//      title:'Wecome to Flutter',
////    主题更换
//      theme: new ThemeData(
//        primaryColor: Colors.white,
//      ),
////    替换初始build
////      home: new RandomWords(),
//      home: new Code2(),
//    );
//  }
//}

//code_3
//class MyApp extends StatelessWidget {
//  @override
//  Widget build (BuildContext context) {
//    return new MaterialApp(
//      theme: new ThemeData(
//        primaryColor: Colors.white,
//      ),
//      home: new ImageListView(),
//    );
//  }
//}

