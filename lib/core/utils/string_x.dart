extension StringX on String {
  String get firstword {
    final words = trim().split(' ');

    // Remove every word after the first one
    for (var i = 1; i < words.length; i++) {
      words[i] = '';
    }

    return words.join(' ');
  }
}
