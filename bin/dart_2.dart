void main() {
  int salary = 1000;
  int workMonthes = 2;

  // ! Postional Paramerters Funation
  // int totalSalary = multiplayTwoNumbers(salary, workMonthes);

  // ! Required Named Paramerters Funation
  // int totalSalary =
  //     multiplayTwoNumbers(secondNumber: workMonthes ,firstNumber: salary);

  // ! Optinal Named Paramerters Funation
  // int totalSalary = multiplayTwoNumbers(
  //     secondNumber: workMonthes, firstNumber: salary, thirdNumber: 20);

  // ! Optinal unamed Paramerters Funation
  // int totalSalary = multiplayTwoNumbers(salary, workMonthes, 20);
  // print(totalSalary);

  Human mohammad = Human(
    name: 'Mohammad',
    age: 26,
  );

  mohammad.age = 20;

  print(mohammad.name);
  print(mohammad.age);
  mohammad.walk();

  Human tahsin = Human(
    name: 'Tahsin',
    age: 30,
  );
  print(tahsin.name);
  print(tahsin.age);

  Car kia = Car(color: 'Black');
  print(kia._name);
  // kia.setName(name: 'KIA');
  kia.setName = 'KIA';

  // print(kia.getName());

  print(kia.name);
}

// ! Funation With Required named and Optinal named paramerters
// int multiplayTwoNumbers(
//     {required int firstNumber,
//     required int secondNumber,
//     int thirdNumber = 1}) {
//   int result = firstNumber * secondNumber * thirdNumber;
//   return result;
//   // return firstNumber * secondNumber;
// }

// ! Funation With Postional and Optinal Unamed paramerters
int multiplayTwoNumbers(int firstNumber, int secondNumber,
    [int thirdNumber = 1]) {
  int result = firstNumber * secondNumber * thirdNumber;
  return result;
  // return firstNumber * secondNumber;
}

class Human {
  late String name;
  late int age;

  Human({required this.name, required this.age});

  void walk() {
    print('human is walking');
  }
}

class Car {
  late String _name;
  late String color;
  late String _model;

  Car({required String color}) {
    this.color = color;
    _name = '';
    _model = '';
  }

  // void setName({required String name}) {
  //   _name = name;
  // }

  set setName(String name) {
    if (name.length <= 5 && name.isNotEmpty) {
      _name = name;
    }
  }

  // String getName() {
  //   return _name;
  // }

  String get name {
    return _name;
  }
}
