import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_driver/src/driver/driver.dart' as tests;

void main() {
  group('Login form tests', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    final loginController_ = tests.find.byValueKey('loginController');
    final phoneController_ = tests.find.byValueKey('phoneController');
    test('Valid check login', () async {
      await driver.tap(loginController_);
      await driver.waitFor(tests.find.text('gr.timurik2001@gmail.com'));
    });
    test('Valid check phone', () async {
      await driver.tap(phoneController_);
      await driver.waitFor(tests.find.text('89872788468'));
    });

    // TODO: write tests
  });

  group('Rigister form tests', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    final loginReController_ = tests.find.byValueKey('loginController');
    final phoneREController_ = tests.find.byValueKey('phoneController');
    final nameReController_ = tests.find.byValueKey('nameReController');
    final lastNameReController_ = tests.find.byValueKey('lastNameReController');
    test('Valid check RE login', () async {
      await driver.tap(loginReController_);
      await driver.waitFor(tests.find.text('gr.timurik2001@gmail.com'));
    });
    test('Valid check RE phone', () async {
      await driver.tap(phoneREController_);
      await driver.waitFor(tests.find.text('89872788468'));
    });
    test('Valid check RE Name', () async {
      await driver.tap(nameReController_);
      await driver.waitFor(tests.find.text('Timur'));
    });
    test('Valid check RE Last Name', () async {
      await driver.tap(lastNameReController_);
      await driver.waitFor(tests.find.text('Gruzkov'));
    });

    // TODO: write tests
  });
}
