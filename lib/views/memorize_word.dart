import 'package:flutter/material.dart';
import 'package:memory_verse/models/word.dart';

class MemorizeWord extends StatelessWidget {
  const MemorizeWord({
    super.key,
    required this.word,
    required this.toggleHidden,
  });

  final Word word;
  final ValueChanged<Word> toggleHidden;

  @override
  Widget build(BuildContext context) {
    if (word.review) {
      return GestureDetector(
        onTap: () => toggleHidden(word),
        child: Container(
            margin: const EdgeInsets.only(left: 2.0, right: 2.0),
            padding: const EdgeInsets.only(left: 3.0, right: 3.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              word.text,
              style: TextStyle(
                fontSize: 16,
                color: word.hidden
                    ? Colors.transparent
                    : Theme.of(context).colorScheme.primary,
              ),
            )),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
        ),
        child: Text(
          word.text,
          style: const TextStyle(fontSize: 16),
        ),
      );
    }
  }
}
