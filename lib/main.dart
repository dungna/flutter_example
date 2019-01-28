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
  final _words = <WordPair>[]; // Words displayed in ListView, 1 row contains 1 word
  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    final wordPair = new WordPair.random();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List of English words"),
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
        return _buildRow(_words[index]); // Wher is _buildRow ?
      })
    );
  }
  Widget _buildRow(WordPair wordPair) {
    return new ListTile(
      title: new Text(
        wordPair.asUpperCase,
        style: new TextStyle(fontSize: 18.0, color: Colors.red),
      ),
    );
  }

class MyApp extends StatelessWidget {
  // Stateless = immutable = cannot change object's properties
  // Every UI components are widgets
  @override
  Widget build(BuildContext context) {
    // Build function returns a "Widget"
    return new MaterialApp(
      title: "THis is my first Flutter app",
      home: new RandomEnglishWords()
    );
  }
}