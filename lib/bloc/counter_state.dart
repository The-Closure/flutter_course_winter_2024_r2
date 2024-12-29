// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CounterState {}

class InitState extends CounterState {}

class TheNumberHasIncreamented extends CounterState {
  int counter;
  TheNumberHasIncreamented({
    required this.counter,
  });
}

class TheNumberHasDecreamented extends CounterState {
  int counter;
  TheNumberHasDecreamented({
    required this.counter,
  });
}

class TheZero extends CounterState {}
