import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFunctions extends GetxController{
  RxInt sec = 1.obs;
  RxBool darKmode = false.obs;
  secondsCounter(){
    sec++;
  }
  toggleDarkMode(bool togg){
    if(togg){
      Get.changeTheme(ThemeData.dark());
    }
    else{
      Get.changeTheme(ThemeData.light());
    }
  }
}