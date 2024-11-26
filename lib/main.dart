import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

List<String> titles = [
  'Burger1',
  'Burger2',
  'Burger3',
  'Burger4',
  'Burger5',
  'Burger6',
  'Burger7',
  'Burger8',
  'Burger9',
  'Burger10',
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageView(
        children: const [
          GirdViewPage(),
          GridViewWithBuilderPage(),
          TextFieldPage()
        ],
      ),
    );
  }
}

class GirdViewPage extends StatelessWidget {
  const GirdViewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          mainAxisExtent: 270,
        ),
        // children: const [
        //   ItemCard(),
        //   ItemCard(),
        //   ItemCard(),
        //   ItemCard(),
        //   ItemCard(),
        //   ItemCard(),
        //   ItemCard(),
        // ],
        children: [
          ...List.generate(titles.length, (index) {
            return ItemCard(
              title: titles[index],
            );
          })
        ],
      ),
    );
  }
}

class GridViewWithBuilderPage extends StatelessWidget {
  const GridViewWithBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 5 / 6,
        ),
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return ItemCard(
            title: titles[index],
          );
        },
      ),
    );
  }
}

TextEditingController emailController = TextEditingController();

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              onChanged: (String changedValue) {
                // print(changedValue);
              },
              onSubmitted: (String value) {
                // print(value);
              },
              maxLines: 1,
              // minLines: 1,
              enabled: true,
              // readOnly: true,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                icon: Icon(
                  Icons.abc,
                  color: Colors.cyan,
                ),
                hintText: 'Plesae Enter Your Email',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                ),
                iconColor: Colors.lime,
                label: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                // prefix: Icon(
                //   Icons.person,
                // ),
                prefixIcon: Icon(
                  Icons.person,
                ),
                prefixIconColor: Colors.yellow,
                prefixStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
                prefixText: 'Email EMAIL',
                // prefixIconConstraints: ,
                // suffix: Icon(
                //   Icons.visibility,
                // ),
                suffixIcon: Icon(
                  Icons.visibility,
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.red,
                ),
                // labelText: 'Email',
                labelStyle: TextStyle(
                  fontSize: 50,
                ),
                // border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                  // borderRadius: BorderRadius.all(
                  //   Radius.circular(
                  //     10,
                  //   ),
                  // ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                print(emailController.text);
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
                alignment: const Alignment(0, 0),
                width: 200,
                height: 50,
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
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

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      // height: 600,
      child: Card(
        shadowColor: Colors.purple.shade200,
        elevation: 10,
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
              width: 300,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://www.certifiedangusbeef.com/_next/image?url=https%3A%2F%2Fappetizing-cactus-7139e93734.media.strapiapp.com%2FClassic_Smashed_Burger_111c4bfdb7.jpeg&w=3840&q=75',
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Dolor voluptate amet laborum qui",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.purple,
                    ),
                    alignment: const Alignment(0, 0),
                    width: 50,
                    height: 30,
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: const Alignment(0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.purple,
                    ),
                    width: 50,
                    height: 30,
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
    );
  }
}
