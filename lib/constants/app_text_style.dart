import 'package:flutter/material.dart';
import 'package:police_complaint_app/constants/app_colors.dart';

class AppTextStyle{

  static normalTextStyle(){
    return const TextStyle(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.bold, 
      fontSize: 20,
    );
  }

  static buttonsTextStyle(){
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
  }

  static largeTextStyle(){
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    );
  }

 static extraLargeTextStyle(){
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      height: 1.2,
      fontSize: 35,
    );
  }
}