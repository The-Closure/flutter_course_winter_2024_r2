import 'package:bloc_session_2/views/posts_page.dart';
import 'package:bloc_session_2/views/products_page.dart';
import 'package:flutter/material.dart';

import 'views/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductsPage(),
    );
  }
}
