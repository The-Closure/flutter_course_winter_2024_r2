import 'dart:io';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              alignment: const Alignment(-0.5, 0),
              // margin: const EdgeInsets.only(
              //   top: 20,
              //   left: 50,
              // ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: const Offset(
                      10,
                      10,
                    ),
                  ),
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 10,
                    offset: const Offset(
                      -10,
                      -10,
                    ),
                  ),
                ],
                color: Colors.red,
                // gradient: const LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     Colors.red,
                //     Colors.purple,
                //   ],
                // ),
                // gradient: const SweepGradient(
                //   center: Alignment.center,
                //   colors: [
                //     Colors.red,
                //     Colors.purple,
                //   ],
                // ),
                gradient: const RadialGradient(
                  radius: 0.8,
                  center: Alignment.center,
                  colors: [
                    Colors.red,
                    Colors.purple,
                  ],
                ),
                borderRadius: BorderRadius.circular(50),
                // shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              width: 250,
              height: 250,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 5,
                ),
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: CircleAvatar(
                    // radius: 60,
                    minRadius: 10,
                    maxRadius: 60,
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.red,
                    child: Text(
                      'Hello Flutter',
                      style: TextStyle(
                        // color: Colors.amber,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: const Alignment(-0.5, 0),
              // margin: const EdgeInsets.only(
              //   top: 20,
              //   left: 50,
              // ),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: Offset(
                      10,
                      10,
                    ),
                  ),
                  BoxShadow(
                    color: Colors.pink,
                    blurRadius: 20,
                    spreadRadius: 10,
                    offset: Offset(
                      -10,
                      -10,
                    ),
                  ),
                ],
                color: Colors.red,
                // gradient: const LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     Colors.red,
                //     Colors.purple,
                //   ],
                // ),
                // gradient: const SweepGradient(
                //   center: Alignment.center,
                //   colors: [
                //     Colors.red,
                //     Colors.purple,
                //   ],
                // ),
                gradient: const RadialGradient(
                  radius: 0.8,
                  center: Alignment.center,
                  colors: [
                    Colors.red,
                    Colors.purple,
                  ],
                ),
                borderRadius: BorderRadius.circular(50),
                // shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              width: 200,
              height: 200,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 5,
                ),
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: CircleAvatar(
                    // radius: 60,
                    minRadius: 10,
                    maxRadius: 60,
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.red,
                    child: Text(
                      'Hello Flutter',
                      style: TextStyle(
                        // color: Colors.amber,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: const Alignment(-0.5, 0),
                  // margin: const EdgeInsets.only(
                  //   top: 20,
                  //   left: 50,
                  // ),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        spreadRadius: 10,
                        offset: Offset(
                          10,
                          10,
                        ),
                      ),
                      BoxShadow(
                        color: Colors.pink,
                        blurRadius: 20,
                        spreadRadius: 10,
                        offset: Offset(
                          -10,
                          -10,
                        ),
                      ),
                    ],
                    color: Colors.red,
                    // gradient: const LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [
                    //     Colors.red,
                    //     Colors.purple,
                    //   ],
                    // ),
                    // gradient: const SweepGradient(
                    //   center: Alignment.center,
                    //   colors: [
                    //     Colors.red,
                    //     Colors.purple,
                    //   ],
                    // ),
                    gradient: const RadialGradient(
                      radius: 0.8,
                      center: Alignment.center,
                      colors: [
                        Colors.red,
                        Colors.purple,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(50),
                    // shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                    ),
                  ),
                  width: 200,
                  height: 200,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 5,
                    ),
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: Center(
                      child: CircleAvatar(
                        // radius: 60,
                        minRadius: 10,
                        maxRadius: 60,
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.red,
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaDLbluuYP12hRciXDymL3KzchMsQCk_fV9mDW8lt30TDSOGcjhlLWXdgo5xeMX48owUc&usqp=CAU',
                                fit: BoxFit.fill,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: const Alignment(-0.5, 0),
                  // margin: const EdgeInsets.only(
                  //   top: 20,
                  //   left: 50,
                  // ),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        spreadRadius: 10,
                        offset: Offset(
                          10,
                          10,
                        ),
                      ),
                      BoxShadow(
                        color: Colors.pink,
                        blurRadius: 20,
                        spreadRadius: 10,
                        offset: Offset(
                          -10,
                          -10,
                        ),
                      ),
                    ],
                    color: Colors.red,
                    // gradient: const LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [
                    //     Colors.red,
                    //     Colors.purple,
                    //   ],
                    // ),
                    // gradient: const SweepGradient(
                    //   center: Alignment.center,
                    //   colors: [
                    //     Colors.red,
                    //     Colors.purple,
                    //   ],
                    // ),
                    gradient: const RadialGradient(
                      radius: 0.8,
                      center: Alignment.center,
                      colors: [
                        Colors.red,
                        Colors.purple,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(50),
                    // shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                    ),
                  ),
                  width: 250,
                  height: 250,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 5,
                    ),
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: Center(
                      child: CircleAvatar(
                        // radius: 60,
                        minRadius: 10,
                        maxRadius: 60,
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.red,
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(
                              File(
                                  'C:/Users/MohammadAlHajjar/Desktop/car.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: const Alignment(-0.5, 0),
              // margin: const EdgeInsets.only(
              //   top: 20,
              //   left: 50,
              // ),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: Offset(
                      10,
                      10,
                    ),
                  ),
                  BoxShadow(
                    color: Colors.pink,
                    blurRadius: 20,
                    spreadRadius: 10,
                    offset: Offset(
                      -10,
                      -10,
                    ),
                  ),
                ],
                color: Colors.red,
                // gradient: const LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     Colors.red,
                //     Colors.purple,
                //   ],
                // ),
                // gradient: const SweepGradient(
                //   center: Alignment.center,
                //   colors: [
                //     Colors.red,
                //     Colors.purple,
                //   ],
                // ),
                gradient: const RadialGradient(
                  radius: 0.8,
                  center: Alignment.center,
                  colors: [
                    Colors.red,
                    Colors.purple,
                  ],
                ),
                borderRadius: BorderRadius.circular(50),
                // shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              width: 200,
              height: 200,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 5,
                ),
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: CircleAvatar(
                    radius: 60,
                    // minRadius: 10,
                    // maxRadius: 60,
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.red,
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/cat.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
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
