import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  Color conatinerColor = Colors.red;
  double conatinerHeight = 500;
  double sliderValue = 0.0;
  bool? isFav = false;

  @override
  Widget build(BuildContext context) {
    print('build funaction work');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(
                seconds: 5,
              ),
              width: 500,
              height: conatinerHeight,
              color: conatinerColor,
              child: Center(
                child: InkWell(
                  onTap: () {
                    // conatinerColor = Colors.green;
                    // print(conatinerColor.value);

                    setState(() {
                      conatinerHeight = 300;
                      conatinerColor = Colors.green;
                    });
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
            Slider(
              thumbColor: Colors.yellow,
              activeColor: Colors.pink,
              inactiveColor: Colors.amber,
              label: '$sliderValue',
              divisions: 4,
              min: 0.0,
              max: 10,
              value: sliderValue,
              onChanged: (double newSliderValue) {
                print(newSliderValue);
                setState(
                  () {
                    sliderValue = newSliderValue;
                  },
                );
              },
            ),
            ListTile(
              onTap: () {
                setState(() {
                  isFav = !isFav!;
                });
              },
              title: const Text('Asus'),
              subtitle: const Text("A55"),
              trailing: isFav == true
                  ? Checkbox(
                      value: isFav,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isFav = newValue;
                        });
                        print(isFav);
                      },
                    )
                  : null,
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.platform,
              title: const Text('Asus'),
              subtitle: const Text('A15'),
              value: isFav,
              onChanged: (bool? newValue) {
                setState(() {
                  isFav = newValue;
                });
                print(isFav);
              },
            ),
            Tooltip(
              message: 'Hello Flutter',
              child: SizedBox(
                width: 50,
                height: 50,
                child: FittedBox(
                  child: Checkbox(
                    tristate: true,
                    side: const BorderSide(color: Colors.orange, width: 3),
                    // shape: const StarBorder(),
                    // shape: CircleBorder(),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          5,
                        ),
                      ),
                    ),
                    splashRadius: 50,
                    // focusNode: FocusNode(),
                    fillColor: const WidgetStatePropertyAll(Colors.lime),
                    overlayColor: const WidgetStatePropertyAll(Colors.green),
                    // hoverColor: Colors.blue,
                    checkColor: Colors.yellow,
                    activeColor: Colors.pink,
                    value: isFav,
                    onChanged: (bool? newValue) {
                      setState(() {
                        isFav = newValue;
                      });
                      print(isFav);
                    },
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
