checkNull({required String value, required String title}) {
    if (value.toLowerCase() == "null") {
      throw FormatException("There is a null value in $title");
    }
    return value;
  }
  