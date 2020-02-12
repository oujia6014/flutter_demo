import 'package:flutter/material.dart';

/*
- 基础部件
1. Icon部件 -> IconBadge
2. 部件集合 -> Stack
3. 设置宽高比 -> AspectRatio
4. 带限制的容器 -> ConstrainedBox
*/

class layoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
//        IconBadge(Icons.power,size: 64)
        StackDemo()
//        AspectRatioDemo()
      ],
    );
  }
}

//带限制的容器
class ConstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 200.0,
        maxWidth: 200.0,
      ),
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

//设置宽高比
class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

//使用子部件最大的宽高作为容器
class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          width: 300.0,
          height: 300.0,
          child: Container(
            alignment: Alignment(0.0,-0.6),
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: Icon(Icons.explore, color: Colors.white, size: 32.0),
          ),
        ),

        SizedBox(
          height: 32.0,
        ),

        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                Color.fromRGBO(7, 102, 255, 1.0),
                Color.fromRGBO(3, 54, 255, 1.0),
              ]),
            ),
            child: Icon(Icons.brightness_2, color: Colors.white, size: 32.0),
          ),
        ),

        Positioned(
          right: 20.0,
          top: 20.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
        ),
        Positioned(
          left: 20.0,
          top: 60.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 18.0),
        ),



      ],
    );
  }
}


class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 0.8),
    );
  }
}