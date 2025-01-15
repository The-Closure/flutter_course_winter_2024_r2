// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_process/logic/calcaulte_result.dart';

import 'package:tdd_process/model/todo_model.dart';
import 'package:tdd_process/service/cat_service.dart';

class MockCatService extends Mock implements CatService {
  @override
  String sound() {
    return "New World";
  }
}

class MockDio extends Mock implements Dio {
  @override
  Future<Response<T>> get<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    return Response(requestOptions: RequestOptions(),statusCode: 200);
  }
}

void main() {
  Map<String, dynamic> map = {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  };
  test("example", () {
    expect(0, 2 - 2);
  });

  test("fromMap function with fulled map", () {
    TodoModel todo = TodoModel.fromMap(map);
    expect(todo, isA<TodoModel>());
  });

  Map<String, dynamic> emptyMap = {};
  test("fromMap function with empty Map", () {
    TodoModel todo = TodoModel.fromMap(emptyMap);
    expect(todo, isA<TodoModel>());
  });

  Map<String, dynamic> halfMap = {"title": "Hello"};
  test('map with half values', () {
    TodoModel todo = TodoModel.fromMap(halfMap);
    expect(todo, isA<TodoModel>());
  });

  group("unit test for logic of score", () {
    test("with valid data", () {
      expect(calculateResult(10, 5, 5, 10, 20), 0);
    });

    test("with invalid 1 data", () {
      expect(calculateResult(0, 0, 5, 10, 20), 0);
    });
    test("with invalid 2 data", () {
      expect(calculateResult(10000, 10000, 5, 0, 20), 0);
    });
    test("with invalid 3 data", () {
      expect(calculateResult(10, 10, -5, 10, 20), isA<Null>());
    });

    test("with valid data", () {
      expect(calculateResult(10, 5, 5, 10, 8), 120);
    });

    test("with invalid 4 data", () {
      expect(calculateResult(0, 0, 5, 10, 8), 120);
    });
    test("with invalid 5 data", () {
      expect(calculateResult(10000, 10000, 5, 0, 8), 120);
    });
    test("with invalid 6 data", () {
      expect(calculateResult(10, 10, -5, 10, 8), isA<Null>());
    });
  });

  test("without mocking", () {
    CatService cat = CatService();
    expect(cat.sound(), "Hello World");
  });

  test("with Mocking", () {
    MockCatService cat = MockCatService();
    expect(cat.sound(), "New World");
  });
}
