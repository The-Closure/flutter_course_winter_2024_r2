import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageView(
        scrollDirection: Axis.horizontal,
        children: const [
          ListViewPage(),
          ListViewBuilderPage(),
          ListViewSeparatedPage(),
          CardPage(),
        ],
      ),
    );
  }
}

List<String> laptops = [
  "Asus",
  'HP',
  'Lenovo',
  "Apple",
  'Acer',
  'Dell',
];

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          height: 600,
          child: Card(
            surfaceTintColor: Colors.white,
            color: Colors.pink.withOpacity(0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.network(
                //   'https://www.certifiedangusbeef.com/_next/image?url=https%3A%2F%2Fappetizing-cactus-7139e93734.media.strapiapp.com%2FClassic_Smashed_Burger_111c4bfdb7.jpeg&w=3840&q=75',
                //   fit: BoxFit.fitHeight,
                // ),
                Container(
                  width: 500,
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://www.certifiedangusbeef.com/_next/image?url=https%3A%2F%2Fappetizing-cactus-7139e93734.media.strapiapp.com%2FClassic_Smashed_Burger_111c4bfdb7.jpeg&w=3840&q=75',
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Burger',
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Dolor voluptate amet laborum qui aliquip ipsum veniam commodo elit cillum eiusmod anim",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.purple,
                        ),
                        alignment: const Alignment(0, 0),
                        width: 100,
                        height: 50,
                        child: const Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        alignment: const Alignment(0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.purple,
                        ),
                        width: 100,
                        height: 50,
                        child: const Text(
                          'More',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListViewSeparatedPage extends StatelessWidget {
  const ListViewSeparatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Seperated Page'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          print('builder index = $index');
          return Container(
            alignment: const Alignment(0, 0),
            width: 200,
            height: 200,
            color: Colors.red.withOpacity(0.2),
            child: Text(
              laptops[index],
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          print('separator index = $index');
          return const Divider(
            height: 100,
            thickness: 5,
            color: Colors.black,
            indent: 20,
            endIndent: 20,
          );
        },
        itemCount: 5,
      ),
    );
  }
}

class ListViewBuilderPage extends StatelessWidget {
  const ListViewBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Builder Page'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: ListView.builder(
              shrinkWrap: false,
              itemCount: laptops.length,
              itemBuilder: (context, index) {
                if (index < 4) {
                  return Container(
                    alignment: const Alignment(0, 0),
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),
                    width: 200,
                    height: 200,
                    child: Text(
                      laptops[index],
                      style: const TextStyle(
                        fontSize: 50,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    alignment: const Alignment(0, 0),
                    margin: const EdgeInsets.all(10),
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                    child: Text(
                      laptops[index],
                      style: const TextStyle(
                        fontSize: 50,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          SizedBox(
            height: 400,
            child: ListView(
              shrinkWrap: false,
              children: [
                Container(
                  alignment: const Alignment(0, 0),
                  margin: const EdgeInsets.all(10),
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: const Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
                Container(
                  alignment: const Alignment(0, 0),
                  margin: const EdgeInsets.all(10),
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: const Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
                Container(
                  alignment: const Alignment(0, 0),
                  margin: const EdgeInsets.all(10),
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: const Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Page'),
      ),
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(
      //         margin: const EdgeInsets.all(10),
      //         width: 200,
      //         height: 200,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.all(10),
      //         width: 200,
      //         height: 200,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.all(10),
      //         width: 200,
      //         height: 200,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.all(10),
      //         width: 200,
      //         height: 200,
      //         color: Colors.red,
      //       ),
      //       SingleChildScrollView(
      //         scrollDirection: Axis.horizontal,
      //         child: Row(
      //           children: [
      //             Container(
      //               margin: const EdgeInsets.all(10),
      //               width: 200,
      //               height: 200,
      //               color: Colors.green,
      //             ),
      //             Container(
      //               margin: const EdgeInsets.all(10),
      //               width: 200,
      //               height: 200,
      //               color: Colors.green,
      //             ),
      //             Container(
      //               margin: const EdgeInsets.all(10),
      //               width: 200,
      //               height: 200,
      //               color: Colors.green,
      //             ),
      //             Container(
      //               margin: const EdgeInsets.all(10),
      //               width: 200,
      //               height: 200,
      //               color: Colors.green,
      //             ),
      //             Container(
      //               margin: const EdgeInsets.all(10),
      //               width: 200,
      //               height: 200,
      //               color: Colors.green,
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: ListView(
        itemExtent: 300,
        padding: const EdgeInsets.all(20),
        reverse: true,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: 200,
            height: 200,
            color: Colors.green,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: 200,
            height: 200,
            color: Colors.green,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: 200,
            height: 200,
            color: Colors.green,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: 200,
            height: 200,
            color: Colors.green,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: 200,
            height: 200,
            color: Colors.green,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: 200,
            height: 200,
            color: Colors.green,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: 200,
            height: 200,
            color: Colors.green,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
