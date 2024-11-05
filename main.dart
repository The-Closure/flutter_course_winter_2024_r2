// ?Void Function

void doSomeCode(int theNumber) {
  print(theNumber / 10);
}

// ? Return Type Function
int addTwoNumber(int firtNumber, int secondNumber) {
  int sum = firtNumber + secondNumber;

  doSomeCode(sum);
  return sum;
}

// ? Required Named Parameters
int addTwoOrThreeNumber({
  required int firstNumber,
  required int secondNumber,
  int thirdNumber = 20,
}) {
  int sum = 0;
  if (thirdNumber == 20) {
    sum = firstNumber + secondNumber;
    return sum;
  } else {
    sum = firstNumber + secondNumber + thirdNumber;
    return sum;
  }
}

// ? Optional Named Parameters with Exception Hanlding
double divideThreeFromAnyNumber({int theNumber = 1}) {
  try {
    num number = theNumber / 1 as int;
    return number as double;
  } catch (e) {
    print(e);
    return 0;
  }
}

main() {
  print(
    divideThreeFromAnyNumber(
      theNumber: 30,
    ),
  );

  print(
    addTwoOrThreeNumber(
      firstNumber: 30,
      secondNumber: 30,
      thirdNumber: 40,
    ),
  );

  // int result = addTwoNumber(30, 40);
  // print(result);

  // int counterOfPeople = 0;
  // print(counterOfPeople);

  // String name = "Hello";
  // print(name);

  // bool isFav = true;
  // print(isFav);

  // double? amount;
  // print(amount.runtimeType);

  // num students = 30.5;
  // print(students.runtimeType);

  // var marks = 3;
  // // marks = 3.4;

  // var hello;
  // print(hello);

  // dynamic anything = "dskajdlksa";
  // anything = 32818321;
  // anything = true;

  // List<String> names = ["Ali", "AbdAlziz", "MHD"];
  // print(names[0]);

  // Map<String, dynamic> table = {
  //   "Name": "Noor",
  //   "Age": 30,
  // };

  // print(table.keys);

  List<Map<String, dynamic>> nestedMap = [
    {
      "Jannaty": 100,
      "Banana": 400,
    },
    {
      "Apple": 32132,
      "Buno": 1000,
    },
  ];

  Map<String, List> nestedList = {
    'names': [
      'ahmad',
      'noor',
      'mhd',
    ],
    'grades': [
      {'class A': 100, 'class B': 70},
      {'class A': 90, 'class B': 55},
      {'class A': 10, 'class B': 60},
      // 60,
      // 59,
    ],
  };
  // print(nestedList['dskjhfkjsdhf']);
  print(nestedList['grades']!.elementAt(0)['class B']);

  // print(nestedList['grades']!.elementAt(2));

  print(nestedMap[1].keys.elementAt(1));

  Map product = {
    "id": 1,
    "title": "Essence Mascara Lash Princess",
    "description":
        "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
    "category": "beauty",
    "price": 9.99,
    "discountPercentage": 7.17,
    "rating": 4.94,
    "stock": 5,
    "tags": ["beauty", "mascara"],
    "brand": "Essence",
    "sku": "RCH45Q1A",
    "weight": 2,
    "dimensions": {"width": 23.17, "height": 14.43, "depth": 28.01},
    "warrantyInformation": "1 month warranty",
    "shippingInformation": "Ships in 1 month",
    "availabilityStatus": "Low Stock",
    "reviews": [
      {
        "rating": 2,
        "comment": "Very unhappy with my purchase!",
        "date": "2024-05-23T08:56:21.618Z",
        "reviewerName": "John Doe",
        "reviewerEmail": "john.doe@x.dummyjson.com"
      },
      {
        "rating": 2,
        "comment": "Not as described!",
        "date": "2024-05-23T08:56:21.618Z",
        "reviewerName": "Nolan Gonzalez",
        "reviewerEmail": "nolan.gonzalez@x.dummyjson.com"
      },
      {
        "rating": 5,
        "comment": "Very satisfied!",
        "date": "2024-05-23T08:56:21.618Z",
        "reviewerName": "Scarlett Wright",
        "reviewerEmail": "scarlett.wright@x.dummyjson.com"
      }
    ],
    "returnPolicy": "30 days return policy",
    "minimumOrderQuantity": 24,
    "meta": {
      "createdAt": "2024-05-23T08:56:21.618Z",
      "updatedAt": "2024-05-23T08:56:21.618Z",
      "barcode": "9164035109868",
      "qrCode": "https://assets.dummyjson.com/public/qr-code.png"
    },
    "images": [
      "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"
    ],
    "thumbnail":
        "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"
  };

  print(product["reviews"][0].values.elementAt(1));
  print(product["reviews"][0]['comment']);
}
