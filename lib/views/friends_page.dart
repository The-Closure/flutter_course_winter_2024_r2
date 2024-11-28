import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Friends Page',
        ),
      ),
      body: const Center(
        child: Text(
          'Friends Page',
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
