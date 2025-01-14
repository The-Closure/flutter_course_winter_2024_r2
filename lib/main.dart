import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                50,
              ),
            ),
          ),
          child: Column(
            children: [
              // const Padding(
              //   padding: EdgeInsets.only(top: 50),
              //   child: Icon(Icons.favorite),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // const Divider(),
              // const SizedBox(
              //   height: 50,
              // ),
              // const DrawerHeader(
              //   child: Icon(
              //     Icons.favorite,
              //   ),
              // ),
              const UserAccountsDrawerHeader(
                accountName: Text('Mohammad Alhajjar'),
                accountEmail: Text(
                  'mohammad@gmail.com',
                ),
                currentAccountPicture: CircleAvatar(
                  child: Text('MH'),
                ),
              ),
              const ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
              const ListTile(
                title: Text('chat'),
                leading: Icon(Icons.chat),
              ),
              ListTile(
                title: const Text('settings'),
                leading: const Icon(Icons.settings),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ));
                },
              ),
              const ListTile(
                title: Text('sign out'),
                leading: Icon(Icons.logout),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('home page'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.ondemand_video,
                ),
                child: Text('audio'),
              ),
              Tab(
                icon: Icon(
                  Icons.audiotrack,
                ),
                child: Text('photo'),
              ),
              Tab(
                icon: Icon(
                  Icons.photo,
                ),
                child: Text('videos'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const WidgetsPage(),
            const SettingsPage(),
            Container(),
          ],
        ),
      ),
    );
  }
}

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({super.key});

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  String selectedItem = 'option1';
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
          value: selectedItem,
          items: const [
            DropdownMenuItem(
              value: 'option1',
              child: Text(
                'option1',
              ),
            ),
            DropdownMenuItem(
              value: 'option2',
              child: Text(
                'option2',
              ),
            ),
            DropdownMenuItem(
              value: 'option3',
              child: Text(
                'option3',
              ),
            ),
            DropdownMenuItem(
              value: '',
              child: Text(
                '',
              ),
            ),
          ],
          onChanged: (newValue) {
            print(newValue);
            selectedItem = newValue ?? '';
            setState(() {});
          },
        ),
        PopupMenuButton(
          tooltip: 'settings',
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: 'settings',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ));
                },
                child: const Text(
                  'settings',
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                      action: SnackBarAction(
                          label: 'close',
                          onPressed: () {
                            print('you closed snackbar');
                          }),
                      content: const Text('you clicked profile button'),
                    ),
                  );
                },
                value: 'profile',
                child: const Text(
                  'profile',
                ),
              ),
              const PopupMenuItem(
                value: 'sign out',
                child: Text(
                  'sign out',
                ),
              ),
            ];
          },
        ),
        const ExpansionTile(
          controlAffinity: ListTileControlAffinity.platform,
          expandedAlignment: Alignment.center,
          initiallyExpanded: true,
          title: Text(
            'Asus vivobook 15',
          ),
          children: [
            Text('CPU: core i5-1135g7'),
            Text('GPU: Nvidia 350mx'),
            Text('Ram: 16GB'),
          ],
        ),
        Switch(
          value: isDark,
          onChanged: (newValue) {
            isDark = newValue;
            setState(() {});
          },
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return Center(
                  child: Container(
                    width: 300,
                    height: 300,
                    color: Colors.purple.shade100,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Are you sure?'),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.green,
                                        behavior: SnackBarBehavior.floating,
                                        action: SnackBarAction(
                                            label: 'close',
                                            onPressed: () {
                                              print('you closed snackbar');
                                            }),
                                        content: const Text(
                                            'you clicked Yes Button'),
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Yes',
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Close',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: const Text(
            'show Dialog',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Icon(Icons.warning),
                  content: const Text('are you sure?'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'yes',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'no',
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text(
            'show atert dialog',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationName: 'facebook',
              applicationIcon: const Icon(Icons.facebook),
              applicationVersion: '1.0.0',
              applicationLegalese: 'applicationLegalese',
            );
          },
          child: const Text(
            'show about dialog',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return SizedBox(
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close')),
                  ),
                );
              },
            );
          },
          child: const Text(
            'show bottom sheet',
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            DateTime? selectedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(2025),
                lastDate: DateTime(2050));
            print(selectedDate!.toUtc());
            var fromattedDate = DateFormat.yMMMd().format(selectedDate);
            print(fromattedDate);
          },
          child: const Text(
            'show date picker',
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            TimeOfDay? selectedTime = await showTimePicker(
              context: context,
              initialTime: const TimeOfDay(
                hour: 10,
                minute: 50,
              ),
            );
            print(selectedTime);
          },
          child: const Text(
            'show time picker',
          ),
        ),
      ],
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('settings'),
      ),
    );
  }
}
