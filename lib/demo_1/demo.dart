import 'package:flutter/material.dart';
import 'a_Listdemo.dart';
import 'b_TextDemo.dart';
import 'c_LayOutDemo.dart';
class Demo_1 extends StatelessWidget {
  @override


  Widget build(BuildContext context) {

    return new DefaultTabController(
        length: 3,
        child: new Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: _appBar(),
            body: _body(),
            drawer: _drawer(context),
            bottomNavigationBar:BottomNavigationBarDemo()
        ));
  }

//  导航
  Widget _appBar() {
    return new AppBar(
      title: new Text('Navigation'), // 标题
      actions: <Widget>[
        // 导航右按钮
        IconButton(
          icon: Icon(Icons.search),
          tooltip: 'Navigration',
          onPressed: () => debugPrint('- click appBar rightBtn'),
        ),
      ],

      bottom: new TabBar(
          unselectedLabelColor: Colors.white54,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 1.0,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.local_florist)),
            Tab(icon: Icon(Icons.change_history)),
            Tab(icon: Icon(Icons.directions_bike)),
          ]),
    );
  }

//  展世层
  Widget _body() {
    return new TabBarView(children: <Widget>[

      /*
        - 图文滚动列表
      */
      DemoOne(),

      /*
        - 基础部件
        1. 文本 -> Text
        2. 行内多样式 -> RichText
        3. 容器 -> Container
        4. 装饰盒子 -> BoxDecoration -> 边框，圆角，阴影，形状，渐变。背景图像
      */
      DemoTwo(),

      /*
        - 基础部件
        1. 文本 -> Text
        2. 行内多样式 -> RichText
        3. 容器 -> Container
        4. 装饰盒子 -> BoxDecoration -> 边框，圆角，阴影，形状，渐变。背景图像
      */
      layoutDemo(),
    ]);
  }

//  左抽屉拉出
  Widget _drawer(context) {
    return new Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
//        用户head
          UserAccountsDrawerHeader(
            accountName: Text(
              'userName',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text('oujia6014@foxmail.com'),
            currentAccountPicture: CircleAvatar(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://resources.ninghao.org/images/childhood-in-a-picture.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.yellow[400].withOpacity(0.6), BlendMode.hardLight),
              ),
            ),
          ),
          ListTile(
            title: Text('Message', textAlign: TextAlign.left),
            trailing: Icon(
              Icons.message,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favorite', textAlign: TextAlign.left),
            trailing: Icon(
              Icons.favorite,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Settings', textAlign: TextAlign.left),
            trailing: Icon(
              Icons.settings,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

}


//底部导航 动态组件
class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarDemoState();
  }
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;

  void _onTapHandler (int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTapHandler,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          title: Text('Explore'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text('History'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text('List'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('My'),
        ),
      ],
    );
  }
}