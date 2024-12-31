part of 'list_bloc.dart';

@immutable
sealed class ListEvent {}

class AddItemToList extends ListEvent{}
class SubItemFromList extends ListEvent{}
