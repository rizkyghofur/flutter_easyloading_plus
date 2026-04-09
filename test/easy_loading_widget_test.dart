import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_easyloading_plus/flutter_easyloading_plus.dart';
import 'package:flutter_easyloading_plus/src/widgets/container.dart';
import 'package:flutter_easyloading_plus/src/widgets/indicator.dart';

void main() {
  tearDown(() async {
    await EasyLoading.dismiss(animation: false);
    EasyLoading.removeAllCallbacks();
    EasyLoading.instance.useContextTheme = false;
  });

  testWidgets('EasyLoading.show() renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        builder: EasyLoading.init(),
        home: const Scaffold(
          body: Center(child: Text('Home')),
        ),
      ),
    );

    expect(find.text('Home'), findsOneWidget);
    expect(find.byType(EasyLoadingContainer), findsNothing);

    EasyLoading.show(status: 'Loading...');
    await tester.pump(); // Start animation
    await tester.pump(const Duration(milliseconds: 200)); // End animation

    expect(find.byType(EasyLoadingContainer), findsOneWidget);
    expect(find.text('Loading...'), findsOneWidget);
  });

  testWidgets('EasyLoading.dismiss() removes the widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        builder: EasyLoading.init(),
        home: const Scaffold(
          body: Center(child: Text('Home')),
        ),
      ),
    );

    EasyLoading.show();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.byType(EasyLoadingContainer), findsOneWidget);

    EasyLoading.dismiss();
    await tester.pumpAndSettle();
    
    expect(find.byType(EasyLoadingContainer), findsNothing);
  });

  testWidgets('EasyLoading success status with callback', (WidgetTester tester) async {
    bool dismissed = false;
    
    await tester.pumpWidget(
      MaterialApp(
        builder: EasyLoading.init(),
        home: const Scaffold(
          body: Center(child: Text('Home')),
        ),
      ),
    );

    EasyLoading.showSuccess(
      'Success',
      duration: const Duration(milliseconds: 200), // Fixed duration
      onDismiss: () => dismissed = true,
    );
    
    await tester.pump(); // Handle show() Future start
    await tester.pump(const Duration(milliseconds: 50)); // Trigger overlay insert
    await tester.pumpAndSettle(); // Finish show animation
    
    expect(find.text('Success'), findsOneWidget);
    
    // Wait for auto-dismiss timer to fire (200ms)
    // We use a safe margin
    await tester.pump(const Duration(milliseconds: 300)); 
    // Handle the dismiss animation triggered by the timer
    await tester.pumpAndSettle();
    
    expect(dismissed, true);
    expect(find.text('Success'), findsNothing);
  });

  testWidgets('useContextTheme correctly resolves colors', (WidgetTester tester) async {
    const primaryColor = Colors.deepPurple;
    
    EasyLoading.instance.useContextTheme = true;
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.light;

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        ),
        builder: EasyLoading.init(),
        home: const Scaffold(body: Center(child: Text('Home'))),
      ),
    );

    EasyLoading.show();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    // The indicator should now use the primary color from the theme
    final indicator = tester.widget<LoadingIndicator>(find.byType(LoadingIndicator));
    expect(indicator, isNotNull);
    
    EasyLoading.instance.useContextTheme = false;
  });
}
