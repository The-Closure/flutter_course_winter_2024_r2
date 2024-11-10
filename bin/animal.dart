import 'dart_oop_r2.dart';

// ! make Anima a final class And see what's wrung
class Animal extends Creature {
  String name;
  String color;
  int age;

  Animal({
    required this.name,
    required this.color,
    required this.age,
  });

  void sound() {
    // if (this is Dog) {
    //   print('$name is making sound: bao hao');
    // } else if (this is Cat) {
    //   print('$name is making sound: Meao Meao');
    // } else {
    //   print('$name is making sound');
    // }
    print('Animal is making sound');
  }

  void walk() {
    print("Animal is walking");
  }

  @override
  void eat() {
    print('Animal is eating');
  }
}
