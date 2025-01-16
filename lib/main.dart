import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_map_animation/core/config/di.dart';
import 'package:theme_map_animation/blocs/theme_bloc/theme_bloc.dart';

import 'core/theme/app_theme.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // sl.get<SharedPreferences>().clear();
    return BlocProvider(
      create: (context) => ThemeBloc()..add(InitTheme()),
      child: Builder(builder: (context) {
        return BlocBuilder<ThemeBloc, ThemeData>(
          builder: (context, state) {
            return MaterialApp(
              theme: state,
              debugShowCheckedModeBanner: false,
              home: const MapPage(),
            );
          },
        );
      }),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.person,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Home page',
        ),
        actions: [
          BlocBuilder<ThemeBloc, ThemeData>(
            builder: (context, state) {
              return Switch(
                value: state == AppTheme.darkTheme,
                onChanged: (newTheme) {
                  context.read<ThemeBloc>().add(ChangeTheme());
                },
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Flutter Course',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Our Session Today is about theming and animation',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text('nothing'))
          ],
        ),
      ),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FlutterMap(
        options: const MapOptions(
          initialZoom: 7,
          initialCenter: LatLng(34.8021, 38.9968),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          const MarkerLayer(
            markers: [
              Marker(
                point: LatLng(34.8021, 38.9968),
                child: Icon(
                  Icons.room,
                  size: 50,
                  color: Colors.red,
                ),
              ),
              Marker(
                point: LatLng(38.8021, 40.9968),
                child: Icon(
                  Icons.room,
                  size: 50,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          PolylineLayer(
            polylines: <Polyline>[
              Polyline(
                points: [
                  const LatLng(34.8021, 38.9968),
                  const LatLng(38.8021, 40.9968),
                ],
                color: Colors.black,
              )
            ],
          ),
          PolygonLayer(
            polygons: <Polygon>[
              Polygon(
                color: Colors.black.withOpacity(0.1),
                points: [
                  const LatLng(34.8021, 38.9968),
                  const LatLng(34.8021, 40.9968),
                  const LatLng(32.8021, 40.9968),
                  const LatLng(32.8021, 38.9968),
                ],
              ),
            ],
          ),
          CircleLayer(circles: <CircleMarker>[
            CircleMarker(
                point: const LatLng(32.8021, 40.9968),
                radius: 100000,
                useRadiusInMeter: true,
                color: Colors.red.withOpacity(0.2))
          ]),
        ],
      ),
    );
  }
}
