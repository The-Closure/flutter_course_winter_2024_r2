import 'package:flutter/material.dart';
import 'package:rest_api_round_2/models/cat_model.dart';
import 'package:rest_api_round_2/services/cat_service.dart';

class CatsPage extends StatefulWidget {
  const CatsPage({super.key});

  @override
  State<CatsPage> createState() => _CatsPageState();
}

class _CatsPageState extends State<CatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createOneCat(
            newCat: CatModel(
              id: "-1",
              name: 'lucy',
              color: 'black',
              image:
                  'https://img.freepik.com/free-photo/cute-domestic-kitten-sits-window-staring-outside-generative-ai_188544-12519.jpg?semt=ais_hybrid',
            ),
          );
          setState(() {
          });
        },
        child: const Icon(
          Icons.pets,
        ),
      ),
      body: FutureBuilder(
        future: getAllCats(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CatModel> cats = snapshot.data!;
            return ListView.builder(
              itemCount: cats.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(cats[index].image),
                  title: Text(cats[index].name),
                  subtitle: Text(cats[index].color),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
