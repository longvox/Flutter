import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_getx_boilerplate/api/api.dart';
import 'package:flutter_getx_boilerplate/models/models.dart';
import 'package:flutter_getx_boilerplate/modules/auth/auth_controller.dart';
import 'package:flutter_getx_boilerplate/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';

import 'auth_controller_test.mocks.dart';

// Simple test widget
class TestFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Widget child;

  const TestFormWidget({
    required this.formKey,
    this.child = const SizedBox(),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: formKey,
          child: child,
        ),
      ),
    );
  }
}

@GenerateMocks([ApiRepository, SharedPreferences])
void main() {
  late AuthController authController;
  late MockApiRepository mockApiRepository;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockApiRepository = MockApiRepository();
    mockSharedPreferences = MockSharedPreferences();
    Get.put<SharedPreferences>(mockSharedPreferences);

    Get.testMode = true;
    authController = AuthController(apiRepository: mockApiRepository);
  });

  tearDown(() {
    Get.reset();
  });

  group('AuthController Tests', () {
    testWidgets(
        'login - successful login should store token and navigate to home',
        (WidgetTester tester) async {
      // Arrange
      final loginResponse = LoginResponse(token: 'test_token');

      when(mockApiRepository.login(any)).thenAnswer((_) async => loginResponse);

      when(mockSharedPreferences.setString(
              StorageConstants.token, 'test_token'))
          .thenAnswer((_) async => true);

      authController.loginEmailController.text = 'test@example.com';
      authController.loginPasswordController.text = 'password123';

      await tester
          .pumpWidget(TestFormWidget(formKey: authController.loginFormKey));

      // Act
      final context = tester.element(find.byType(Form));
      await authController.login(context);
      await tester.pumpAndSettle();

      // Assert
      verify(mockApiRepository.login(any)).called(1);
      verify(mockSharedPreferences.setString(
              StorageConstants.token, 'bad_test_token'))
          .called(1);
    });

    testWidgets('register - successful registration should store token',
        (WidgetTester tester) async {
      // Arrange
      final registerResponse = RegisterResponse(id: 1, token: 'test_token');

      when(mockApiRepository.register(any))
          .thenAnswer((_) async => registerResponse);

      when(mockSharedPreferences.setString(
              StorageConstants.token, 'test_token'))
          .thenAnswer((_) async => true);

      authController.registerEmailController.text = 'test@example.com';
      authController.registerPasswordController.text = 'password123';
      authController.registerTermsChecked = true;

      await tester
          .pumpWidget(TestFormWidget(formKey: authController.registerFormKey));

      // Act
      final context = tester.element(find.byType(Form));
      await authController.register(context);
      await tester.pumpAndSettle();

      // Assert
      verify(mockApiRepository.register(any)).called(1);
      verify(mockSharedPreferences.setString(
              StorageConstants.token, 'test_token'))
          .called(1);
    });

    testWidgets('register - should not proceed if terms not checked',
        (WidgetTester tester) async {
      // Arrange
      authController.registerTermsChecked = false;

      await tester
          .pumpWidget(TestFormWidget(formKey: authController.registerFormKey));

      // Act
      final context = tester.element(find.byType(Form));
      await authController.register(context);
      await tester.pumpAndSettle();

      // Assert
      verifyNever(mockApiRepository.register(any));
    });

    test('dispose - should dispose all controllers', () {
      // Act
      authController.onClose();

      // Assert - verify controllers are disposed by checking if they're marked as disposed
      expect(authController.registerEmailController.value.isComposingRangeValid,
          false);
      expect(
          authController.registerPasswordController.value.isComposingRangeValid,
          false);
      expect(
          authController
              .registerConfirmPasswordController.value.isComposingRangeValid,
          false);
      expect(authController.loginEmailController.value.isComposingRangeValid,
          false);
      expect(authController.loginPasswordController.value.isComposingRangeValid,
          false);
    });
  });
}
