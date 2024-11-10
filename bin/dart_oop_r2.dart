import 'cat.dart';
import 'animal.dart';

main() async {
  Animal animal = Animal(
    name: 'spike',
    color: 'brown',
    age: 2,
  );

  print(animal.name);

  animal.sound();
  animal.walk();
  Animal lucky = Dog(name: "Lucky", color: 'White', age: 10, dogType: 'Haski');

  print(lucky.runtimeType);

  Dog sharlock = Dog(
    name: 'sharlock',
    color: 'Gray',
    age: 5,
    dogType: "Haski",
  );
  print(sharlock.name);
  print(sharlock.dogType);

  sharlock.sound();
  sharlock.walk();
  sharlock.bark();

  Cat kitty = Cat(name: 'Kitty', color: 'White', age: 1);

  kitty.sound();
  kitty.walk();

  Tiger sharokhan = Tiger(name: 'sharokhan', color: 'Gold', age: 10);

  sharokhan.sound();
  // Snacke snacke = Snacke(age: 10, name: 'snacke', color: 'black');
  // snacke.walk();
  // Animal snacke1 = Snacke(age: 10, name: 'snacke', color: 'black');
  // snacke1.sound();
  // print(snacke1.runtimeType);

  Human human = Human();
  human.eat();
  lucky.eat();
  // Creature creature = Creature();
  print('before dalay');
  await Future.delayed(Duration(seconds: 5),
      // printInFuture,
      () {
    print('hello world from the future with anynomouns funation');
  });
  print('after dalay');

  Function function = printInFuture;
  function();

  Function function2 = () {
    print('printed with object of Function');
  };

  function2();
}

void printInFuture() {
  print('hello world from the future');
}

class Dog extends Animal {
  String dogType;
  Dog({
    required super.name,
    required super.color,
    required super.age,
    required this.dogType,
  });

  void bark() {
    print("Dog is barking");
  }

  @override
  void sound() {
    print('Dog is making sound: bao hao');
  }
}

class Tiger extends Animal {
  Tiger({required super.name, required super.color, required super.age});
  // @override
  @override
  void sound() {
    print('Tiger is making sound: Roooooooooooor');
  }
}

// class Snacke implements Animal {
//   @override
//   int age;

//   @override
//   String color;

//   @override
//   String name;
//   Snacke({required this.age, required this.name, required this.color});

//   @override
//   void sound() {
//     // TODO: implement sound
//   }

//   @override
//   void walk() {
//     // TODO: implement walk
//   }
//   // Snacke({required super.name, required super.color, required super.age});
// }

abstract class Creature {
  void eat();
}

class Human extends Creature {
  @override
  void eat() {
    print("human is eating");
  }
}
