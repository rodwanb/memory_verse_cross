import 'package:flutter/material.dart';
import 'package:memory_verse/models/verse.dart';
import 'package:memory_verse/views/memorize_verse_page.dart';

class MemoryVersesPage extends StatefulWidget {
  const MemoryVersesPage({super.key, required this.title});

  final String title;

  @override
  State<MemoryVersesPage> createState() => _MemoryVersesPageState();
}

class _MemoryVersesPageState extends State<MemoryVersesPage> {
  final List<Verse> verses = Verse.testVerses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: verses.length,
        itemBuilder: (BuildContext context, int index) {
          Verse verse = verses[index];
          return ListTile(
            title: Text(verse.reference),
            leading: const Icon(Icons.library_books_rounded),
            subtitle: Text(
              verse.text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => MemorizeVersePage(verse: verse)),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
