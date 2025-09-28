class Post {
  final int? id;         // opcional, porque un nuevo post puede no tener id todavía
  final String title;
  final String body;
  final int userId;

  Post({
    this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  // Crear un Post desde JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'], // puede venir null
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      userId: json['userId'] ?? 0,
    );
  }

  // Convertir un Post a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'userId': userId,
    };
  }
}
