import 'package:flutter/foundation.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];
  bool _isLoading = false;
  String _error = '';

  // Posts de ejemplo EN ESPAÑOL que se mostrarán inmediatamente
  final List<Post> _postsEjemplo = [
    Post(
      id: 1,
      title: "¡Encontré las botas perfectas! 👢",
      body: "Chicas, después de buscar por todas partes, finalmente encontré las botas ideales en Barcelle. Son super cómodas y están de moda.",
      userId: 1,
    ),
    Post(
      id: 2, 
      title: "Código de descuento 20% off 💕",
      body: "Comparto con ustedes mi código de descuento: CHICBLOG20. Funciona en varias tiendas online de moda. ¡Aprovechen!",
      userId: 1,
    ),
    Post(
      id: 3,
      title: "Rutina de skincare que cambió mi piel ✨",
      body: "Después de meses probando productos, encontré la combinación perfecta para mi piel mixta. ¿Quieren que comparta mi rutina?",
      userId: 2,
    ),
  ];

  List<Post> get posts => _posts.isNotEmpty ? _posts : _postsEjemplo;
  bool get isLoading => _isLoading;
  String get error => _error;

  // Búsqueda simplificada
  List<Post> searchPosts(String query) {
    final lista = _posts.isNotEmpty ? _posts : _postsEjemplo;
    if (query.isEmpty) return lista;
    
    return lista.where((post) =>
      post.title.toLowerCase().contains(query.toLowerCase()) ||
      post.body.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Carga SIMPLIFICADA - sin esperar la API
  Future<void> loadPosts() async {
    _isLoading = true;
    notifyListeners();

    // Usar posts de ejemplo inmediatamente
    _posts = _postsEjemplo;
    
    // Intentar cargar de la API en segundo plano (opcional)
    try {
      final apiPosts = await ApiService.getPosts();
      if (apiPosts.isNotEmpty) {
        _posts = apiPosts;
      }
    } catch (e) {
      // Si falla la API, mantener los posts de ejemplo
      print("Error de API: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Métodos restantes igual...
  Future<bool> createPost(Post post) async {
    _isLoading = true;
    notifyListeners();

    try {
      final newPost = await ApiService.createPost(post);
      _posts.insert(0, newPost);
      return true;
    } catch (e) {
      // Si falla la API, agregar localmente
      _posts.insert(0, post);
      return true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updatePost(Post post) async {
    _isLoading = true;
    notifyListeners();

    try {
      final index = _posts.indexWhere((p) => p.id == post.id);
      if (index != -1) {
        _posts[index] = post;
      }
      return true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> deletePost(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _posts.removeWhere((post) => post.id == id);
      return true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}