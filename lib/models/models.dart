class Movie {
  final String name;
  final String? imageUrl;
  final String? summary;

  Movie({required this.name, this.imageUrl, this.summary});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      name: json['name'] ?? 'Unknown',
      imageUrl: json['image']?['medium'],
      summary: json['summary'] ?? 'No description available',
    );
  }
}
