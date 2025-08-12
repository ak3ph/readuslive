class EventModel {
  final String id;
  final String title;
  final String authorId;
  final String authorName;
  final String authorImage;
  final DateTime eventDate;
  final String description;
  final int attendeeCount;
  final bool isLive;
  final String? bookId;
  final String? bookTitle;

  EventModel({
    required this.id,
    required this.title,
    required this.authorId,
    required this.authorName,
    required this.authorImage,
    required this.eventDate,
    required this.description,
    this.attendeeCount = 0,
    this.isLive = false,
    this.bookId,
    this.bookTitle,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      authorId: json['authorId'],
      authorName: json['authorName'],
      authorImage: json['authorImage'],
      eventDate: DateTime.parse(json['eventDate']),
      description: json['description'],
      attendeeCount: json['attendeeCount'] ?? 0,
      isLive: json['isLive'] ?? false,
      bookId: json['bookId'],
      bookTitle: json['bookTitle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'authorId': authorId,
      'authorName': authorName,
      'authorImage': authorImage,
      'eventDate': eventDate.toIso8601String(),
      'description': description,
      'attendeeCount': attendeeCount,
      'isLive': isLive,
      'bookId': bookId,
      'bookTitle': bookTitle,
    };
  }
}
