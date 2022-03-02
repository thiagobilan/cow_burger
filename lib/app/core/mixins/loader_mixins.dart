import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixins on GetxController {
  void loaderListener(RxBool loading) {
    ever(
      loading,
      (callback) async {
        if (loading.isTrue) {
          await Get.dialog(
              WillPopScope(
                onWillPop: () async => false,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              barrierDismissible: false);
        } else {
          Get.back();
        }
      },
    );
  }
}
