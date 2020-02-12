import 'package:flutter/material.dart';
//import './model/post.dart';
import 'package:flutter_app/model/post.dart';

class DemoOne extends StatelessWidget {
  @override
  Widget _listView() {
    return new ListView.builder(
        itemCount: posts.length,
        itemBuilder: _listItem
    );
  }

  Widget _listItem(BuildContext context, int index) {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Column(
        children: <Widget>[
          Image.network(posts[index].imageUrl),
          SizedBox(height: 16.0),
          Text(
            posts[index].title,
            style: Theme.of(context).textTheme.title,
          ),
          Text(
            posts[index].author,
            style: Theme.of(context).textTheme.subhead,
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: _listView(),
    );
  }
}
