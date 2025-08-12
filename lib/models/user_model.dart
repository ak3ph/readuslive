class UserModel {
  final String id;
  final String name;
  final String email;
  final bool isAuthor;
  final String profileImage;
  final String? bio;
  final int followers;
  final int following;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.isAuthor,
    required this.profileImage,
    this.bio,
    this.followers = 0,
    this.following = 0,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      isAuthor: json['isAuthor'] ?? false,
      profileImage: json['profileImage'] ?? '',
      bio: json['bio'],
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'isAuthor': isAuthor,
      'profileImage': profileImage,
      'bio': bio,
      'followers': followers,
      'following': following,
    };
  }
}
