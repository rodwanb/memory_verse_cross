import 'package:flutter/material.dart';
import 'package:memory_verse/views/memory_verses_page.dart';

void main() {
  runApp(const MemoryVerseApp());
}

class MemoryVerseApp extends StatelessWidget {
  const MemoryVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Verse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MemoryVersesPage(title: 'Memory Verse'),
    );
  }
}
