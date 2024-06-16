class User {
  final String fullName;
  final String imageUrl;

  const User({
    required this.fullName,
    required this.imageUrl,
  });

  User copyWith({
    String? fullName,
    String? imageUrl,
  }) {
    return User(
      fullName: fullName ?? this.fullName,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
