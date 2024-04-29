import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo con Navigator'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text('Ejemplo Navigator'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const RandomNouns();
                }),
              );
            },
            child: const Text('NOUNS'),
          ),
          const SizedBox(height: 16), // Add some space between buttons
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const RandomWords();
                }),
              );
            },
            child: const Text('WORDPAIR'),
          ),
        ],
      ),
    );
  }
}


class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  } Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Flutter'),
      ),
      body: _buildSuggestions(),
    );
  }
}

class RandomWords extends StatefulWidget{
  const RandomWords({super.key});
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomNounsState extends State<RandomNouns> {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Flutter'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(String noun) {
    return ListTile(
      title: Text(
        noun,
        style: _biggerFont,
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(nouns.take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }
}

class RandomNouns extends StatefulWidget {
  const RandomNouns({super.key});
  @override
  RandomNounsState createState() => RandomNounsState();
}

