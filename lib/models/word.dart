import 'package:flutter/material.dart';

class Word {
  final String id = UniqueKey().toString();
  String text;
  bool hidden;
  bool review;

  Word(this.text, this.hidden, this.review);
}
