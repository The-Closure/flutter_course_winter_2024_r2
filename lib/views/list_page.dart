import 'package:bloc_session_2/blocs/list_bloc/list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<ListBloc>().add(AddItemToList());
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<ListBloc>().add(SubItemFromList());
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
          body: BlocBuilder<ListBloc, ListState>(
            builder: (context, state) {
              if (state is ItemCounterChanged) {
                return ListView.builder(
                  itemCount: state.itemsCounter,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 60,
                      color: Colors.amber,
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('Press The Add Button'),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
