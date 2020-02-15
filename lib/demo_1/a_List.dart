import 'package:flutter/material.dart';
//import './model/post.dart';
import 'package:flutter_app/model/post.dart';
import 'f_Details.dart';

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
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16/9,
                child: Image.network(posts[index].imageUrl,fit: BoxFit.cover,),
              ),
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
          Positioned.fill(child: Material(
            color: Colors.transparent,
            child:InkWell(
              splashColor: Colors.white.withOpacity(0.3),
              highlightColor: Colors.white.withOpacity(0.1),
              onTap: (){
                debugPrint('--TapItem');

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DetailsView(post: posts[index]))
                );

              },
            )
          ))



        ],
      )
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: _listView(),
    );
  }
}
