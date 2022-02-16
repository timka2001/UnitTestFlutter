import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_13/main.dart';

void main() {
  test('Valid check login', () {
    final counter = ValidInformation();
    expect(counter.isValidEmail(loginController.text), true);
  });
  test('Valid check phone', () {
    final counter = ValidInformation();

    expect(counter.isValidPhoneNumber(phoneController.text), true);
  });
  test('Valid check RE login', () {
    final counter = ValidInformation();

    expect(counter.isValidEmail(loginReController.text), true);
  });
  test('Valid check RE phone', () {
    final counter = ValidInformation();

    expect(counter.isValidPhoneNumber(phoneREController.text), true);
  });
  test('Valid check RE Name', () {
    final counter = ValidInformation();

    expect(counter.isValidNameAndLastName(nameReController.text), true);
  });
  test('Valid check RE Last Name', () {
    final counter = ValidInformation();

    expect(counter.isValidNameAndLastName(lastNameReController.text), true);
  });
}
