import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//2. 添加一个 有状态的部件（Stateful widget）
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

//class RandomWordsState extends State<RandomWords> {
//  @override
//  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
//  }
//}

//3. 创建一个无限滚动ListView
class RandomWordsState extends State<RandomWords> {
  @override
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>(); // 收藏数组
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
        if (i.isOdd) return new Divider();
        final index =i ~/ 2;
        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

//  Widget _buildRow(WordPair pair){
//    return new ListTile(
//      title: new Text(
//        pair.asPascalCase,
//        style: _biggerFont,
//      ),
//    );
//  }

//  4. 添加交互 收藏功能
  Widget _buildRow(WordPair pair){
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

// 5. 导航到信息页面
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('列表展示'),
//        5. 导航到信息页面
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}