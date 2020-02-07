import 'package:flutter/material.dart';
import '../model/post.dart';

//class Code3 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('列表展示'),
//      ),
//      body: new Center(
//        child: new Text('列表展示'),
//      ),
//    );
//  }
//}

class ImageListView extends StatelessWidget {
  @override
  Widget _appBar() {
    return new AppBar(title: new Text('-列表展示-'));
  }

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
      appBar: _appBar(),
      body: _listView(),
    );
  }
}
