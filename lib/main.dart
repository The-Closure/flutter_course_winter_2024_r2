import 'package:flutter/material.dart';
import 'package:rest_api_round_2/views/cats_page.dart';
import 'package:rest_api_round_2/views/list_of_posts_page.dart';

import 'views/post_page.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CatsPage(),
    );
  }
}
