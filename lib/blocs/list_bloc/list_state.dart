// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_bloc.dart';

@immutable
sealed class ListState {}

final class ListInitial extends ListState {}



// ! first solution (bad code)
// class ItemAddedToList extends ListState {
//   final int itemsCounter;
//   ItemAddedToList({
//     required this.itemsCounter,
//   });
// }

// class ItemSubedFromList extends ListState {
//   final int itemsCounter;

//   ItemSubedFromList({required this.itemsCounter});
// }

// ! second solution (good code with 1 dollar)

class ItemCounterChanged extends ListState {
  final int itemsCounter;
  ItemCounterChanged({
    required this.itemsCounter,
  });
}

