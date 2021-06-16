import 'package:flutter/material.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:english_words/english_words.dart';

class RestaurantsScreen extends stateFullWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .3,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              UIHeader(),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment(-1, 0.2),
                  child: Text(
                    "Restaurants",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .7,
          width: MediaQuery.of(context).size.width,
          child: RandomWords(),
        )
      ],
    );
  }
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18.0);
  // #enddocregion RWS-var

  // #docregion _buildSuggestions
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }
  // #enddocregion _buildSuggestions

  Widget _myListView(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Sun'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.brightness_3),
            title: Text('Moon'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.star),
            title: Text('Star'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Sun'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.brightness_3),
            title: Text('Moon'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.star),
            title: Text('Star'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Sun'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.brightness_3),
            title: Text('Moon'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.star),
            title: Text('Star'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Sun'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.brightness_3),
            title: Text('Moon'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.star),
            title: Text('Star'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Sun'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.brightness_3),
            title: Text('Moon'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.star),
            title: Text('Star'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Sun'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.brightness_3),
            title: Text('Moon'),
            trailing: Icon(Icons.keyboard_arrow_right)),
        ListTile(
            leading: Icon(Icons.star),
            title: Text('Star'),
            trailing: Icon(Icons.keyboard_arrow_right)),
      ],
    );
  }

  // #docregion _buildRow
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
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
  // #enddocregion _buildRow

  // #docregion RWS-build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _myListView(context),
    );
  }
  // #enddocregion RWS-build

  // #docregion RWS-var
}
// #enddocregion RWS-var

class RandomWords extends StatefulWidget {
  @override
  State<RandomWords> createState() => _RandomWordsState();
}
