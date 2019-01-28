import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// Defin "root widget"
void main() => runApp(new MyApp()); // one-line function
// StatefullWidget
class RandomEnglishWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomEnglishWordsState(); // return a state's object. Where is the state's class ?
  }
}
//State
class RandomEnglishWordsState extends State<RandomEnglishWords> {
  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    final wordPair = new WordPair.random();
    return new Text(
        wordPair.asUpperCase,
        style: new TextStyle(fontSize: 20.0)
    );
  }
}
class MyApp extends StatelessWidget {
  // Stateless = immutable = cannot change object's properties
  // Every UI components are widgets
  @override
  Widget build(BuildContext context) {
    // Build function returns a "Widget"
    return new MaterialApp(
      title: "THis is my first Flutter app",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("This is Header's title")
        ),
        body: new Center(
          child: new RandomEnglishWords()
        ),
      ),
    );
  }
}