class Verse {
  final String reference;
  final String text;
  final String version;

  Verse(this.reference, this.text, this.version);

  static List<Verse> testVerses() {
    return [
      Verse(
        "John 17:17",
        "Sanctify[a] them by Your truth. Your word is truth.",
        "nkjv",
      ),
      Verse(
        "John 1:1-3",
        "In the beginning was the Word, and the Word was with God, and the Word was God. 2 He was in the beginning with God. 3 All things were made through Him, and without Him nothing was made that was made.",
        "nkjv",
      ),
      Verse(
        "Revelation 14:12",
        "Here is the [a]patience of the saints; here[b] are those who keep the commandments of God and the faith of Jesus.",
        "nkjv",
      ),
    ];
  }
}
