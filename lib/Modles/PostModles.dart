class PostModles {
  final num userId;
  final num id;
  final String title;
  final String body;

  // Constructor
  PostModles({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // Factory for JSON parsing
  factory PostModles.fromJson(Map<String, dynamic> json) {
    return PostModles(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }

  // Copy with method
  PostModles copyWith({
    num? userId,
    num? id,
    String? title,
    String? body,
  }) {
    return PostModles(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
