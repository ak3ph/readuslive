class BookModel {
  final String id;
  final String title;
  final String authorId;
  final String authorName;
  final String coverImage;
  final String description;
  final double rating;
  final int reviewCount;
  final List<String> categories;
  final DateTime publishDate;

  BookModel({
    required this.id,
    required this.title,
    required this.authorId,
    required this.authorName,
    required this.coverImage,
    required this.description,
    this.rating = 0.0,
    this.reviewCount = 0,
    required this.categories,
    required this.publishDate,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      authorId: json['authorId'],
      authorName: json['authorName'],
      coverImage: json['coverImage'],
      description: json['description'],
      rating: json['rating'] ?? 0.0,
      reviewCount: json['reviewCount'] ?? 0,
      categories: List<String>.from(json['categories'] ?? []),
      publishDate: DateTime.parse(json['publishDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'authorId': authorId,
      'authorName': authorName,
      'coverImage': coverImage,
      'description': description,
      'rating': rating,
      'reviewCount': reviewCount,
      'categories': categories,
      'publishDate': publishDate.toIso8601String(),
    };
  }
}
