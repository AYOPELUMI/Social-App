// book_model.dart

class Book {
  final int id;
  final String title;
  final List<String> subjects;
  final List<Person> authors;
  final List<Person> translators;
  final List<String> bookshelves;
  final List<String> languages;
  final bool? copyright;
  final String mediaType;
  final Map<String, String> formats;
  final int downloadCount;

  Book({
    required this.id,
    required this.title,
    required this.subjects,
    required this.authors,
    required this.translators,
    required this.bookshelves,
    required this.languages,
    this.copyright,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      subjects: List<String>.from(json['subjects']),
      authors: (json['authors'] as List).map((author) => Person.fromJson(author)).toList(),
      translators: (json['translators'] as List).map((translator) => Person.fromJson(translator)).toList(),
      bookshelves: List<String>.from(json['bookshelves']),
      languages: List<String>.from(json['languages']),
      copyright: json['copyright'],
      mediaType: json['media_type'],
      formats: Map<String, String>.from(json['formats']),
      downloadCount: json['download_count'],
    );
  }
}

class Person {
  final int? birthYear;
  final int? deathYear;
  final String name;

  Person({
    this.birthYear,
    this.deathYear,
    required this.name,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      birthYear: json['birth_year'],
      deathYear: json['death_year'],
      name: json['name'],
    );
  }
}
