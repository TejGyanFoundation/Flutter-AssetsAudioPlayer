import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CircularLoader {
  bool isLoading = false;
  void hideCircularLoader() {
    isLoading = false;
    EasyLoading.dismiss();
  }

  void showCircularLoader() {
    try {
      isLoading = true;
      applyDefaultStyle();
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void applyDefaultStyle() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 12.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
