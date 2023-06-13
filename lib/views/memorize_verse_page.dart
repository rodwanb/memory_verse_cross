import 'dart:math';
import 'package:flutter/material.dart';
import 'package:memory_verse/views/memorize_word.dart';
import '../models/verse.dart';
import '../models/word.dart';

class MemorizeVersePage extends StatefulWidget {
  final Verse verse;

  const MemorizeVersePage({super.key, required this.verse});

  @override
  State<MemorizeVersePage> createState() => _MemorizeVersePageState();
}

class _MemorizeVersePageState extends State<MemorizeVersePage> {
  List<Word> words = [];
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    words =
        widget.verse.text.split(' ').map((e) => Word(e, true, false)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Memorize Verse'),
      ),
      body: ListView(
        children: [
          LinearProgressIndicator(
            // minHeight: 6,
            value: progress,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.verse.reference,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 2.0,
              runSpacing: 6.0,
              children: [
                for (var word in words)
                  MemorizeWord(word: word, toggleHidden: _toggleHidden),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'previousButton',
            onPressed: () => _stepBackward(),
            tooltip: 'Previous',
            child: const Icon(Icons.chevron_left),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'nextButton',
            onPressed: () => _stepForward(),
            tooltip: 'Next',
            child: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }

  void _toggleHidden(Word word) {
    setState(() {
      word.hidden = !word.hidden;
      words.where((element) => element.id != word.id).forEach((element) {
        element.hidden = true;
      });
    });
  }

  void _stepForward() {
    setState(() {
      progress = min(1.0, progress + 0.1);
      _prepareWordsForReview();
    });
  }

  void _stepBackward() {
    setState(() {
      progress = max(0.0, progress - 0.1);
      _prepareWordsForReview();
    });
  }

  void _prepareWordsForReview() {
    var numberOfWordsToRandomize =
        min(words.length, (words.length * progress).round());
    var wordsCopy = words.toList();
    wordsCopy.shuffle();
    var wordsToReview = wordsCopy.take(numberOfWordsToRandomize);
    for (int i = 0; i < words.length; i++) {
      words[i].review = wordsToReview.contains(words[i]);
      words[i].hidden = true;
    }
  }
}
