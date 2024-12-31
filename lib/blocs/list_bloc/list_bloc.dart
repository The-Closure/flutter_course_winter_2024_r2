import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  int counter = 0;
  ListBloc() : super(ListInitial()) {
    on<AddItemToList>(
      (event, emit) {
        print('event is here');
        print(counter);
        counter++;
        print(counter);
        emit(
          ItemCounterChanged(itemsCounter: counter),
        );
      },
    );
    on<SubItemFromList>(
      (event, emit) {
        counter--;
        emit(
          ItemCounterChanged(
            itemsCounter: counter,
          ),
        );
      },
    );
  }
}
