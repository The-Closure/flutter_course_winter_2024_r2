import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_bloc/lamp/bloc/lamp_bloc.dart';

class LampPage extends StatelessWidget {
  const LampPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LampBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: BlocBuilder<LampBloc, LampState>(
              builder: (context, state) {
                if (state is TurnOn) {
                  return InkWell(
                    onTap: () {
                      context.read<LampBloc>().add(ChangeColor());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.yellow),
                      width: 300,
                      height: 300,
                    ),
                  );
                } else if (state is LampIsBroken) {
                  return Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    width: 300,
                    height: 300,
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      context.read<LampBloc>().add(ChangeColor());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      width: 300,
                      height: 300,
                    ),
                  );
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
