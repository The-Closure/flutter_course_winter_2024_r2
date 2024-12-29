import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_bloc/bloc/counter_event.dart';
import 'package:intro_to_bloc/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitState()) {
    int counter = 0;
    on<Increament>(
      (event, emit) {
        counter++;
        // print(event);
        // print(state);
        emit(
          TheNumberHasIncreamented(
            counter: counter,
          ),
        );
        // print(state);
      },
    );

    on<Decreament>(
      (event, emit) {
        if (counter <= 0) {
        } else {
          counter--;
          // print(event);
          // print(state);
          emit(
            TheNumberHasDecreamented(
              counter: counter,
            ),
          );
        }
        // print(state);
      },
    );

    on<RestoreToZero>(
      (event, emit) {
        counter = 0;
        emit(TheZero());
      },
    );
  }
}
