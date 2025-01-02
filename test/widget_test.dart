// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_boilerplate/main.dart';
import 'package:flutter_getx_boilerplate/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  testWidgets('App should render and show splash screen', (WidgetTester tester) async {
    // Initialize GetX test mode and dependencies
    Get.testMode = true;
    final mockPrefs = MockSharedPreferences();
    when(mockPrefs.getString(any)).thenReturn(null);
    Get.put<SharedPreferences>(mockPrefs);
    
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());

    // Verify that we have a GetMaterialApp
    expect(find.byType(GetMaterialApp), findsOneWidget);
    
    // Verify initial route is splash
    expect(Get.currentRoute, equals(Routes.SPLASH));
    
    // Wait for splash screen timer and navigation
    await tester.pump(Duration(milliseconds: 2000));
    await tester.pumpAndSettle();
    
    // After splash screen timer, we should be on the auth screen since no token is set
    expect(Get.currentRoute, equals(Routes.AUTH));
  });
}
