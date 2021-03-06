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
  final _words =
      <WordPair>[]; // Words displayed in ListView, 1 row contains 1 word
  final _checkedWords =
      new Set<WordPair>(); // Set contains "no duplicate items"
  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("List of English words"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.list), onPressed: _pushToSavedWordsScreen)
          ],
        ),
        body: new ListView.builder(itemBuilder: (context, index) {
          if (index >= _words.length) {
            _words.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_words[index], index); // Wher is _buildRow ?
        }));
  }

  _pushToSavedWordsScreen() {
//    print("You pressed to the right icon");
  final pageRoute = new MaterialPageRoute(builder: (context) {
    // map function = Convert this list to another list(maybe different object's type)
    // _checkedWords(list of WordPair) => map =>
    // converted to a lazy list(Iterable) of ListTile
    final listTiles = _checkedWords.map((wordPair) {
      return new ListTile(
        title: new Text(wordPair.asUpperCase,
            style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      );
    });
    // Now return a widget, we choose "Scaffold"
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Checked words"),
      ),
      body: new ListView(children: listTiles.toList(),), // Lazy list(Iterable) => List
    );

  });
  Navigator.of(context).push(pageRoute);
  }

  Widget _buildRow(WordPair wordPair, int index) {
    final textColor = index % 2 == 0 ? Colors.red : Colors.blue;
    final isChecked = _checkedWords.contains(wordPair);
    return new ListTile(
      // leading: left trailing: right
      leading: new Icon(
        isChecked ? Icons.check_box : Icons.check_box_outline_blank,
        color: textColor,
      ),
      title: new Text(
        wordPair.asUpperCase,
        style: new TextStyle(fontSize: 18.0, color: textColor),
      ),
      onTap: () {
        setState(() {
          if (isChecked) {
            _checkedWords.remove(wordPair); // Remove item in a Set
          } else {
            _checkedWords.add(wordPair);
          }
        });
      },
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
        title: "THis is my first Flutter app", home: new RandomEnglishWords());
  }
}
