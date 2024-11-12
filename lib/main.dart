import 'package:flutter/material.dart';

// f({required A a}) {}

// abstract class A {
//   sound();
// }

// abstract class B extends A {}

// class C extends B {}

// class D extends C {}

main() {
  // f(a: D());
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.yellow,
          backgroundColor: Colors.purple,
          // centerTitle: true,
          leading: const FlutterLogo(),
          title: const Center(child: Text("Hello Form Logo")),
          actions: const [
            FlutterLogo(),
            Icon(
              Icons.facebook,
              color: Colors.blue,
            )
          ],
        ),
        body: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyContainer(),
              MyContainer(),
              MyContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Hello Wolrd",
      ),
      // color: Colors.red,
      width: 140,
      height: 140,
      padding: const EdgeInsets.only(
        left: 20,
      ),
      // margin: const EdgeInsets.all(20),
      // alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.yellow,
            Colors.purple,
          ],
        ),
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
        ),
        color: Colors.red,
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('JH'),
        ),
      ),
    );
  }
}
