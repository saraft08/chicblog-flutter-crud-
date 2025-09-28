import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/post_provider.dart';
import 'screens/list_screen.dart';
import 'utils/constants.dart'; // ✅ Importar constantes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostProvider()..loadPosts(), // ✅ CORREGIDO (dos puntos)
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // ✅ CORREGIDO (Show, no Shot)
        title: AppConstants.appName, // ✅ CORREGIDO (usar la clase)
        theme: ThemeData(
          primaryColor: AppColors.primaryPink, // ✅ CORREGIDO (usar la clase)
          useMaterial3: true, // ✅ CORREGIDO (Material3, no butorials)
        ),
        home: const ListScreen(),
      ),
    );
  }
}