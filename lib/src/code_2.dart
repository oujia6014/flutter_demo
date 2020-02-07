import 'package:flutter/material.dart';


class Code2 extends StatefulWidget {
  @override
  createState() => new Xxx();
}


class Xxx extends State {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    '标题xxxxxxxx',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  '简介xxxxxxxxxx',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[300],
          ),
          new Text('41'),
        ],
      ),
    );

    Widget banner = new Image.asset(
        'images/lake.jpg',
      width: 200.0,
      height: 240.0,
      fit:BoxFit.cover
    );

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Widget 布局 学习'),
        ),
        body:new ListView(
          children: <Widget>[
            banner,
            titleSection,
          ],
        ),
//        body: new Center(
//          child: new Image.asset('images/lake.jpg'),
//        ),
      ),
    );
  }
}