import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:something/bloc/profile_bloc/bloc/profile_bloc.dart';
import 'package:something/core/config/di.dart';
import 'package:something/core/resources/strings_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()
        ..add(
          GetProfile(),
        ),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('data'),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // storage.setString('name', 'Ali');
                    sl.get<SharedPreferences>().setString('name', 'Ali');
                    // storage.setInt('age', 22);
                    sl.get<SharedPreferences>().setInt('age', 22);
                  },
                  child: Text(
                    StringsManager.saveData,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // print(storage.getString('name'));
                    print(sl.get<SharedPreferences>().getString('name'));
                    // print(storage.getInt('age'));
                    print(sl.get<SharedPreferences>().getInt('age'));
                  },
                  child: Text(
                    StringsManager.getData,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // storage.remove('name');
                    sl.get<SharedPreferences>().remove('name');
                  },
                  child: Text(
                    StringsManager.removeData,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // storage.clear();
                    sl.get<SharedPreferences>().clear();
                  },
                  child: Text(
                    StringsManager.clearData,
                  ),
                ),
                BlocConsumer<ProfileBloc, ProfileState>(
                  listener: (context, state) {
                    if (state is ProfileError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Please check your username and password',
                          ),
                        ),
                      );
                    } else if (state is ProfileSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            'sucess',
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is ProfileSuccess) {
                      return Text(state.profileModel.username);
                    } else if (state is ProfileError) {
                      return Text(state.errorMessage);
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
