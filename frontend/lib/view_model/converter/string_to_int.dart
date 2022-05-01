class StringConverter {
  final String value;
  StringConverter({required this.value});

  int convert() {
    return int.parse(value);
  }
}

