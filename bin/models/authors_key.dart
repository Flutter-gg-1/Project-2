class Authors {
  final List<String> authors;
  Authors({required this.authors});
  // Factory Constructor to take the JSON data and convert it to an object
  factory Authors.fromJson(Map<String, dynamic> json) {
    return Authors(
      authors: List<String>.from(json['authors']),
    );
  }
  // Function to convert the object to a JSON data
  Map<String, dynamic> toJson() {
    return {
      'authors': authors,
    };
  }
}