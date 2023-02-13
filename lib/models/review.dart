class Review {
  final String name;
  final DateTime date;
  final double pontuation;
  final String description;

  const Review({
    required this.name,
    required this.date,
    required this.pontuation,
    required this.description
  });

  String get dateFormatted => "${this.date.day.toString().padLeft(2, "0")}.${this.date.month.toString().padLeft(2, "0")}.${this.date.year.toString().padLeft(2, "0")}";
  
  String get charsPhoto {
    List<String> words = this.name.split(" ");
    return words[0][0] + words[1][0];
  }
}