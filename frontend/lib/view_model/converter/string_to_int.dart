class StringConverter {
  final String value;
  StringConverter({required this.value});

  double convert() {
    String? newValue;
    if (value[0] == "." && value.length == 1) {
      newValue = "0";
      return double.parse(newValue);
    } else if (value[value.length - 1] == ".") {
      newValue = value.substring(0, value.length - 1);
      return double.parse(newValue);
    } else {
      return double.parse(value);
    }
  }
}
