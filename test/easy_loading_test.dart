import 'package:flutter/material.dart';
import 'package:flutter_easyloading_plus/flutter_easyloading_plus.dart';
import 'package:flutter_easyloading_plus/src/theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EasyLoadingTheme Unit Tests', () {
    test('Default EasyLoadingStyle.dark colors', () {
      EasyLoading.instance.loadingStyle = EasyLoadingStyle.dark;
      expect(EasyLoadingTheme.indicatorColor, Colors.white);
      expect(EasyLoadingTheme.textColor, Colors.white);
      expect(EasyLoadingTheme.backgroundColor,
          // ignore: deprecated_member_use
          Colors.black.withOpacity(0.9));
    });

    test('Default EasyLoadingStyle.light colors', () {
      EasyLoading.instance.loadingStyle = EasyLoadingStyle.light;
      expect(EasyLoadingTheme.indicatorColor, Colors.black);
      expect(EasyLoadingTheme.textColor, Colors.black);
      expect(EasyLoadingTheme.backgroundColor, Colors.white);
    });

    test('Custom EasyLoadingStyle colors', () {
      EasyLoading.instance
        ..loadingStyle = EasyLoadingStyle.custom
        ..indicatorColor = Colors.red
        ..textColor = Colors.blue
        ..backgroundColor = Colors.green;

      expect(EasyLoadingTheme.indicatorColor, Colors.red);
      expect(EasyLoadingTheme.textColor, Colors.blue);
      expect(EasyLoadingTheme.backgroundColor, Colors.green);
    });
  });

  group('EasyLoading Singleton State', () {
    test('Initial values', () {
      final instance = EasyLoading.instance;
      expect(instance.useContextTheme, false);
      expect(instance.indicatorSize, 40.0);
      expect(instance.radius, 5.0);
    });

    test('Status Callback management', () {
      void callback(EasyLoadingStatus status) {}

      EasyLoading.addStatusCallback(callback);
      // We can't easily trigger the private _statusCallbacks from here without more logic,
      // but we can verify registration if there was a getter.
      // For now, we trust the implementation or add more public markers.
      EasyLoading.removeCallback(callback);
      EasyLoading.removeAllCallbacks();
    });
  });
}
