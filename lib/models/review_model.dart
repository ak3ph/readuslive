class ReviewModel {
  final String id;
  final String bookId;
  final String userId;
  final String userName;
  final String userImage;
  final double rating;
  final String comment;
  final DateTime createdAt;
  final String? authorResponse;
  final DateTime? authorResponseDate;

  ReviewModel({
    required this.id,
    required this.bookId,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.comment,
    required this.createdAt,
    this.authorResponse,
    this.authorResponseDate,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      bookId: json['bookId'],
      userId: json['userId'],
      userName: json['userName'],
      userImage: json['userImage'],
      rating: json['rating'] ?? 0.0,
      comment: json['comment'],
      createdAt: DateTime.parse(json['createdAt']),
      authorResponse: json['authorResponse'],
      authorResponseDate: json['authorResponseDate'] != null
          ? DateTime.parse(json['authorResponseDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookId': bookId,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
      'authorResponse': authorResponse,
      'authorResponseDate':
          authorResponseDate?.toIso8601String(),
    };
  }
}
