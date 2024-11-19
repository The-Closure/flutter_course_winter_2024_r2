import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

PageController onBoardingController = PageController(
  initialPage: 2,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          onPageChanged: (int index) {
            print('Page Changed To $index');
          },
          controller: onBoardingController,
          reverse: false,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: const [
            FirstPage(),
            SecondPage(),
            ThirdPage(),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "1",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                print('Go To Last Page Button Pressed');
                onBoardingController.jumpToPage(2);
                // onBoardingController.jumpTo(300);
                print(onBoardingController.page);
              },
              child: Container(
                alignment: const Alignment(0, 0),
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      offset: const Offset(
                        5,
                        5,
                      ),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Go To Last Page',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                onBoardingController.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceOut,
                );
              },
              child: Container(
                alignment: const Alignment(0, 0),
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      offset: const Offset(
                        5,
                        5,
                      ),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "2",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                iconColor: Colors.cyanAccent,
                textColor: Colors.red,
                enabled: true,
                splashColor: Colors.red.withOpacity(0.1),
                // focusColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hoverColor: Colors.teal,
                onTap: () {
                  print('This a OnTap From ListTile');
                },
                onLongPress: () {
                  print('This a OnLongPress From ListTile');
                },
                tileColor: Colors.pink.withOpacity(0.2),
                selectedTileColor: Colors.orange,
                // selectedColor: Colors.yellow,
                selected: false,
                leading: const CircleAvatar(
                  child: Text('A'),
                ),
                trailing: const SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.check,
                      ),
                      Text('9:30 PM')
                    ],
                  ),
                ),
                title: const Text(
                  'Abd Alaziz',
                  // style: TextStyle(color: Colors.black),
                ),
                subtitle: const Text('Hello Flutter'),
              ),
            ),
            InkWell(
              onTap: () {
                onBoardingController.previousPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceOut,
                );
              },
              child: Container(
                alignment: const Alignment(0, 0),
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      offset: const Offset(
                        5,
                        5,
                      ),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Previous',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "3",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                // print('Go To First Page Button Pressed');
                onBoardingController.animateToPage(
                  0,
                  duration: const Duration(
                    seconds: 3,
                  ),
                  curve: Curves.bounceIn,
                );
                // onBoardingController.animateTo(
                //   600,
                //   duration: const Duration(seconds: 3),
                //   curve: Curves.linear,
                // );
                // print(onBoardingController.page);
              },
              child: Container(
                alignment: const Alignment(0, 0),
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      offset: const Offset(
                        5,
                        5,
                      ),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Go To First Page',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
