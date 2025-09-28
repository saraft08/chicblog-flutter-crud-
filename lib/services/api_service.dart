import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  // URL base de la API
  static const String baseUrl = "https://jsonplaceholder.typicode.com";

  /// --------------------
  /// GET - Traer todos los posts
  /// --------------------
  static Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse("$baseUrl/posts"));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception("Error al cargar los posts");
    }
  }

  /// --------------------
  /// GET - Traer un post por ID
  /// --------------------
  static Future<Post> getPost(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/posts/$id"));

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error al cargar el post con id $id");
    }
  }

  /// --------------------
  /// POST - Crear un nuevo post
  /// --------------------
  static Future<Post> createPost(Post post) async {
    final response = await http.post(
      Uri.parse("$baseUrl/posts"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(post.toJson()),
    );

    if (response.statusCode == 201) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error al crear el post");
    }
  }

  /// --------------------
  /// PUT - Actualizar un post existente
  /// --------------------
  static Future<Post> updatePost(Post post) async {
    final response = await http.put(
      Uri.parse("$baseUrl/posts/${post.id}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(post.toJson()),
    );

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error al actualizar el post");
    }
  }

  /// --------------------
  /// DELETE - Eliminar un post por ID
  /// --------------------
  static Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/posts/$id"));

    if (response.statusCode != 200) {
      throw Exception("Error al eliminar el post con id $id");
    }
  }
}
