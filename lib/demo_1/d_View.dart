import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/post.dart';
/*
- 基础部件
`1
*/

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

//图文网格布局
class GridViewBuilderDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context,int index){
    return Container(
      child: Image.network(
          posts[index].imageUrl,
          fit: BoxFit.cover
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: posts.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120.0,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0
        ),
        itemBuilder: _gridItemBuilder
    );
  }
}

//网格布局上下滚动
class GridViewExentDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          'Item $index',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
      maxCrossAxisExtent: 150.0,
      //最大横轴宽度
      crossAxisSpacing: 1.0,
      mainAxisSpacing: 1.0,
      scrollDirection: Axis.vertical,
      children: _buildTiles(100),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          'Item $index',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisCount: 5,
      //每行几个
      crossAxisSpacing: 1.0,
      mainAxisSpacing: 1.0,
      scrollDirection: Axis.vertical,
      children: _buildTiles(100),
    );
  }
}

//带图片左右滚动pageview
class PageViewBuilderDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
//      fit: StackFit.expand,
      children: <Widget>[
        SizedBox.expand(
          //填满父类的box
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          //图片信息绝对定位
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(posts[index].title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
              Text(
                posts[index].author,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
        itemCount: posts.length, itemBuilder: _pageItemBuilder);
  }
}

//上下滚动pageview
class pageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
//      reverse: true,//翻转滚动
      scrollDirection: Axis.vertical, //垂直滚动
      onPageChanged: (currentPage) => debugPrint('page: $currentPage'), //监听当前页面
      controller: PageController(
          //控制器
          initialPage: 1, //初始化时加载页面
          keepPage: false,
          viewportFraction: 0.85 //占当前容器的百分比
          ),
      children: <Widget>[
        Container(
          color: Colors.grey[500],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'ONE',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.red[500],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'TWO',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.blue[500],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'THREE',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
