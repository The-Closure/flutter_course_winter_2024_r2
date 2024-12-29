import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lamp_event.dart';
part 'lamp_state.dart';

class LampBloc extends Bloc<LampEvent, LampState> {
  LampBloc() : super(TurnOff()) {
    int counter = 0;
    on<ChangeColor>((event, emit) {
      if (state is TurnOff) {
        counter++;
        if (counter > 5) {
          emit(LampIsBroken());
        }else {
        emit(TurnOn());

        }
      } else {
        emit(TurnOff());
      }
    });
  }
}
