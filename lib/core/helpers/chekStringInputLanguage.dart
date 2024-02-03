bool isArabic(String input) {
  return RegExp(r'[\u0600-\u06FF]').hasMatch(input);
}
