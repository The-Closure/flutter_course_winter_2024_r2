import 'animal.dart';

final class Cat extends Animal {
  int numberOfArms;
  Cat({
    required super.name,
    required super.color,
    required super.age,
    this.numberOfArms = 4,
  });
  @override
  void sound() {
    print('Cat is making sound: Meao Meao');
  }
}
