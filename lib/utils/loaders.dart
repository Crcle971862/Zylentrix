import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class Loaders {
  static successSnackBar({required title,message='',duration=3}){
    Get.snackbar(
        title,message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.blueAccent,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin:const EdgeInsets.all(10),
        icon:const Icon(Icons.check,color: Colors.white,)

    );
  }

  static warningSnackBar({required title,message=''}){
    Get.snackbar(
        title,message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration:const Duration(seconds:3),
        margin:const EdgeInsets.all(20),
        icon:const Icon(Icons.warning,color: Colors.white,)

    );
  }

  static errorSnackBar({required title,message=''}){
    Get.snackbar(
        title,message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration:const Duration(seconds:3),
        margin:const EdgeInsets.all(20),
        icon:const Icon(Icons.warning,color: Colors.white,)

    );
  }
}