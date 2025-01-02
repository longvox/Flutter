import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/api/api.dart';
import 'package:flutter_getx_boilerplate/models/models.dart';
import 'package:flutter_getx_boilerplate/routes/app_pages.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final ApiRepository apiRepository;
  AuthController({required this.apiRepository});

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();
  bool registerTermsChecked = false;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> register(BuildContext context) async {
    AppFocus.unfocus(context);
    if (registerFormKey.currentState!.validate()) {
      if (!registerTermsChecked) {
        CommonWidget.toast('Please check the terms first.');
        return;
      }

      try {
        final res = await apiRepository.register(
          RegisterRequest(
            email: registerEmailController.text,
            password: registerPasswordController.text,
          ),
        );

        final prefs = Get.find<SharedPreferences>();
        if (res != null && res.token.isNotEmpty) {
          await prefs.setString(StorageConstants.token, res.token);
          await Get.offNamed(Routes.HOME);
        }
      } catch (e) {
        CommonWidget.toast('Registration failed: ${e.toString()}');
      }
    }
  }

  Future<void> login(BuildContext context) async {
    AppFocus.unfocus(context);
    if (loginFormKey.currentState!.validate()) {
      try {
        final res = await apiRepository.login(
          LoginRequest(
            email: loginEmailController.text,
            password: loginPasswordController.text,
          ),
        );

        final prefs = Get.find<SharedPreferences>();
        if (res != null && res.token.isNotEmpty) {
          await prefs.setString(StorageConstants.token, res.token);
          await Get.offNamed(Routes.HOME);
        }
      } catch (e) {
        CommonWidget.toast('Login failed: ${e.toString()}');
      }
    }
  }

  @override
  void onClose() {
    super.onClose();

    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();

    loginEmailController.dispose();
    loginPasswordController.dispose();
  }
}
