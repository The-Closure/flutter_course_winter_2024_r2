import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Color conatinerColor = Colors.red;
  double conatinerHeight = 300;
  Alignment buttonAlign = Alignment.center;
  late AnimationController animationController;
  late Animation<Color?> colorAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    print('page is created');
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    colorAnimation = ColorTween(
      begin: Colors.grey.shade300,
      end: Colors.red,
    ).animate(animationController);

    sizeAnimation = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween(begin: 100, end: 200),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: 200, end: 100),
        weight: 50,
      ),
    ]).animate(animationController);

    animationController.addListener(
      () {
        // print(animation.value!.value);
        print(Colors.red.value);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    print('page is destoried');
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('scaffold is build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        toolbarHeight: 150,
        title: TweenAnimationBuilder(
          builder: (context, value, child) {
            // print(value);
            return Padding(
              padding: EdgeInsets.only(
                top: value * 100,
              ),
              child: Opacity(
                opacity: value,
                child: const Text(
                  'Hello Flutter',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            );
          },
          tween: Tween<double>(
            begin: 0,
            end: 1,
          ),
          duration: const Duration(
            seconds: 3,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: 300,
              height: conatinerHeight,
              curve: Curves.bounceInOut,
              color: conatinerColor,
              duration: const Duration(seconds: 3),
              child: AnimatedAlign(
                alignment: buttonAlign,
                duration: const Duration(seconds: 3),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    maximumSize: WidgetStatePropertyAll(
                      Size(
                        200,
                        50,
                      ),
                    ),
                    // fixedSize: WidgetStatePropertyAll(
                    //   Size(
                    //     100,
                    //     50,
                    //   ),
                    // ),
                    // minimumSize: WidgetStatePropertyAll(
                    //   Size(
                    //     70,
                    //     50,
                    //   ),
                    // ),
                  ),
                  onPressed: () {
                    conatinerColor = Colors.blue;
                    conatinerHeight = 500;
                    buttonAlign = Alignment.topLeft;
                    setState(() {});
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'change color',
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return IconButton(
                    onPressed: () async {
                      print(animationController.isCompleted);
                      animationController.isCompleted
                          ? animationController.reverse()
                          : animationController.forward();
                      await Future.delayed(
                          const Duration(
                            seconds: 4,
                          ), () {
                        print(animationController.isCompleted);
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: sizeAnimation.value,
                      color: colorAnimation.value,
                    ),
                  );
                }),
            Lottie.asset(
              'assets/lottie/lottie_file.json',
              width: 100,
              height: 100,
            ),
            Lottie.network(
                'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
            Switch(
              value: false,
              onChanged: (value) {},
            ),
            CupertinoSwitch(
              value: false,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
