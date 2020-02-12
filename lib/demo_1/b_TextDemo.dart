import 'package:flutter/material.dart';

/*
- 基础部件
1. 文本 -> Text
2. 行内多样式 -> RichText
3. 容器 -> Container
4. 装饰盒子 -> BoxDecoration -> 边框，圆角，阴影，形状，渐变。背景图像
*/

class DemoTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerBoxDecorationDemo();
  }
}

class ContainerBoxDecorationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(// 背景部分
        image: DecorationImage(
          image: NetworkImage('https://resources.ninghao.org/images/say-hello-to-barry.jpg'),
          alignment: Alignment.center,
          fit:BoxFit.cover,
          colorFilter: ColorFilter.mode(// 滤镜样式
            Colors.indigoAccent[400].withOpacity(0.8),
            BlendMode.softLight
          ),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.pool,size: 50.0,color: Colors.white,),
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            width: 150.0,
            height: 150.0,
            decoration:BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, .5),

              border: Border.all(// 描边
                color: Colors.blue[100],
                width: 1.0,
                style: BorderStyle.solid
              ),

              boxShadow: [// 阴影
                BoxShadow(
                  offset: Offset(8.0,16.0),
                  color: Color.fromRGBO(16, 20, 188, 1.0),
                  blurRadius: 20.0,
                  spreadRadius: -2.0
                )
              ],

              shape: BoxShape.circle,// 设置为原型

              gradient: LinearGradient(// 渐变
                  colors:[
                    Color.fromRGBO(2, 28, 128, 0.7),
                    Color.fromRGBO(2, 102, 255, 1.0),
                  ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )


            ),
          )
        ],
      ),


    );
  }
}


//文字样式修改
class RichTextDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: TextSpan(
        text: 'nihao',
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 34.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100
        ),
          children:[
            TextSpan(
              text: '.net',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.red
              )
            )
          ]
      ),

    );
  }
}



//Text控件基本使用
class TextDemo extends StatelessWidget {
  @override
  final TextStyle _textStyle = TextStyle(fontSize: 16.0);
  final String _author = '李白';
  final String _title = '将进酒';

  Widget build(BuildContext context) {
    return Text(
      '《 $_author 》 《$_title》。君不见黄河之水天上来，奔流到海不复回。君不见高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。',
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
