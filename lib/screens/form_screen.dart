import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';
import '../models/post_model.dart';

class FormScreen extends StatefulWidget {
  final int? postId;

  const FormScreen({super.key, this.postId});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _userIdController = TextEditingController(text: '1');

  bool _isEditing = false;
  Post? _existingPost;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.postId != null;
    
    if (_isEditing) {
      _loadPostData();
    }
  }

  void _loadPostData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final postProvider = Provider.of<PostProvider>(context, listen: false);
      try {
        _existingPost = postProvider.posts.firstWhere(
          (post) => post.id == widget.postId,
        );
        _titleController.text = _existingPost!.title;
        _bodyController.text = _existingPost!.body;
        _userIdController.text = _existingPost!.userId.toString();
      } catch (e) {
        // Si no encuentra el post en la lista, navegar hacia atrás
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Editar Post' : 'Crear Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un título';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _bodyController,
                decoration: const InputDecoration(
                  labelText: 'Contenido',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el contenido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _userIdController,
                decoration: const InputDecoration(
                  labelText: 'User ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un User ID';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor ingresa un número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Consumer<PostProvider>(
                builder: (context, postProvider, child) {
                  if (postProvider.isLoading) {
                    return const CircularProgressIndicator();
                  }
                  
                  return ElevatedButton(
                    onPressed: () => _submitForm(postProvider),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Text(_isEditing ? 'Actualizar' : 'Crear'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm(PostProvider postProvider) async {
    if (_formKey.currentState!.validate()) {
      final newPost = Post(
        id: _isEditing ? _existingPost!.id : null,
        title: _titleController.text,
        body: _bodyController.text,
        userId: int.parse(_userIdController.text),
      );

      bool success;
      if (_isEditing) {
        success = await postProvider.updatePost(newPost);
      } else {
        success = await postProvider.createPost(newPost);
      }

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isEditing ? 'Post actualizado!' : 'Post creado!'),
          ),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    _userIdController.dispose();
    super.dispose();
  }
}