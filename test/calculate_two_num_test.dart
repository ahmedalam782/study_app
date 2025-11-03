// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:study_app/unite_test/calculate_two_num.dart';
import 'package:test/test.dart';

void main() {
  group('Test start, add', () {
    test('add two positive numbers', () {
      expect(CalculateTwoNum.add(2, 3), 5);
    });

    test('add two negative numbers', () {
      expect(CalculateTwoNum.add(-2, -3), -5);
    });

    test('add one negative and one positive number', () {
      expect(CalculateTwoNum.add(-5, 3), -2);
    });
    test('add zero and a number', () {
      expect(CalculateTwoNum.add(0, 4), 4);
    });
    test('add a number and zero', () {
      expect(CalculateTwoNum.add(4, 0), 4);
    });
  });
  group('Test start, subtract', () {

    test('subtract two positive numbers', () {
      expect(CalculateTwoNum.subtract(5, 3), 2);
    });
    test('subtract two negative numbers', () {
      expect(CalculateTwoNum.subtract(-5, -3), -2);
    });
    test('subtract one negative and one positive number', () {
      expect(CalculateTwoNum.subtract(-2, 3), -5);
    });
    test('subtract zero and a number', () {
      expect(CalculateTwoNum.subtract(0, 4), -4);
    });
    test('subtract a number and zero', () {
      expect(CalculateTwoNum.subtract(4, 0), 4);
    });
  });
}
