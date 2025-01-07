import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        DatabaseReference ref = FirebaseDatabase.instance.ref();
        // await ref.set({
        //   "name": "John",
        //   "age": 18,
        //   "address": {"line1": "100 Mountain View"}
        // });
        await ref.update({
          "age": 100,
        });
      }),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
