// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CatPage extends StatefulWidget {
  const CatPage({super.key});

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  dynamic result;
  CatModel? cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          result = await getOneCat();
          cat = CatModel.fromMap(result);
          setState(() {});
          print(result);
        },
      ),
      body: Center(
        child: result == null && cat == null
            ? const CircularProgressIndicator()
            : ListTile(
                // title: Text(result['origin']),
                title: Text(cat!.name),
                // subtitle: Text(result['description']),
                subtitle: Text(cat!.description),
                // leading: Image.network(result['image']),
                leading: Image.network(cat!.image),
              ),
      ),
    );
  }
}

class CatPageWithFutureBuilder extends StatelessWidget {
  const CatPageWithFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getOneCat(),
          builder: (context, snapshot) {
            print(snapshot.data);

            if (snapshot.hasData) {
              CatModel cat = CatModel.fromMap(snapshot.data);
              return Center(
                child: ListTile(
                  // title: Text(snapshot.data['name']),
                  title: Text(cat.name),
                  // subtitle: Text(snapshot.data['description']),
                  subtitle: Text(cat.description),
                  // leading: Image.network(snapshot.data['image']),
                  leading: Image.network(cat.image),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getOneMovie(),
          builder: (context, snapshot) {
            print(snapshot.data);

            if (snapshot.hasData) {
              MovieModel movie = MovieModel.fromMap(snapshot.data);
              return Center(
                child: ListTile(
                  // title: Text(snapshot.data['name']),
                  title: Text(movie.title),
                  // subtitle: Text(snapshot.data['description']),
                  subtitle: Text(movie.plot),
                  // leading: Image.network(snapshot.data['image']),
                  leading: Image.network(movie.poster),
                  trailing: Text(
                    movie.rating.toString(),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class CatModel {
  int id;
  String name;
  String description;
  String image;
  CatModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  static fromMap(Map<String, dynamic> map) {
    return CatModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      image: map['image'],
    );
  }
}

class MovieModel {
  int id;
  String title;
  double rating;
  String plot;
  String poster;
  MovieModel({
    required this.id,
    required this.title,
    required this.rating,
    required this.plot,
    required this.poster,
  });

  static fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      title: map['title'],
      rating: map['rating'],
      plot: map['plot'],
      poster: map['poster'],
    );
  }
}

Future<dynamic> getOneCat() async {
  final dio = Dio();
  var response = await dio.get('https://www.freetestapi.com/api/v1/cats/1');
  return response.data;
}

Future<dynamic> getOneMovie() async {
  final dio = Dio();
  var response = await dio.get('https://www.freetestapi.com/api/v1/movies/1');
  return response.data;
}
