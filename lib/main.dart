import 'package:flutter/material.dart';
import 'package:stateful_check_box_slider_navigation/views/chat_page.dart';
import 'package:stateful_check_box_slider_navigation/views/friends_page.dart';
import 'package:stateful_check_box_slider_navigation/views/map_page.dart';

import 'views/home_page.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pageIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    const MapPage(),
    const FriendsPage(),
    const ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          indicatorColor: Colors.blue,
          indicatorShape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          surfaceTintColor: Colors.green,
          animationDuration: const Duration(seconds: 2),
          onDestinationSelected: (int selectedPageIndex) {
            setState(() {
              pageIndex = selectedPageIndex;
            });
          },
          selectedIndex: pageIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.place,
              ),
              label: 'Map',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.group,
              ),
              label: 'Friends',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.chat,
              ),
              label: 'Chat',
            ),
          ],
        ),
        body: pages[pageIndex],
      ),
    );
  }
}

class MyAppPage extends StatelessWidget {
  MyAppPage({super.key});
  Color conatinerColor = Colors.red;
  double conatinerHeight = 500;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 500,
            height: conatinerHeight,
            color: conatinerColor,
            child: Center(
              child: InkWell(
                onTap: () {
                  // conatinerColor = Colors.green;
                  // print(conatinerColor.value);
                  conatinerHeight = 300;
                  print(conatinerHeight);
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                      color: Colors.white),
                  child: const Center(
                    child: Text(
                      'change color',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
