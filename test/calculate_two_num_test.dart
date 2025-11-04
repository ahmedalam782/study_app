// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:study_app/unite_test/calculate_two_num.dart';

void main() {
  group('Test start, add', () {
    test('two positive numbers', () {
      expect(CalculateTwoNum.add(2, 3), 5);
    });

    test('two negative numbers', () {
      expect(CalculateTwoNum.add(-2, -3), -5);
    });

    test('one negative and one positive number', () {
      expect(CalculateTwoNum.add(-5, 3), -2);
    });
    test('zero and a number', () {
      expect(CalculateTwoNum.add(0, 4), 4);
    });
    test('a number and zero', () {
      expect(CalculateTwoNum.add(4, 0), 4);
    });
  });
  group('Test start, subtract', () {
    test('two positive numbers', () {
      expect(CalculateTwoNum.subtract(5, 3), 2);
    });
    test('two negative numbers', () {
      expect(CalculateTwoNum.subtract(-5, -3), -2);
    });
    test('one negative and one positive number', () {
      expect(CalculateTwoNum.subtract(-2, 3), -5);
    });
    test('zero and a number', () {
      expect(CalculateTwoNum.subtract(0, 4), -4);
    });
    test('a number and zero', () {
      expect(CalculateTwoNum.subtract(4, 0), 4);
    });
  });
}
