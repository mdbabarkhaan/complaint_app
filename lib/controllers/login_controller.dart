import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_complaint_app/constants/app_colors.dart';
import 'package:police_complaint_app/constants/firebase_references.dart';
import 'package:police_complaint_app/screens/HomePage.dart';
import 'package:police_complaint_app/utilites/utils.dart';
class LoginController with ChangeNotifier{

  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  userLogin({BuildContext? context, String? email, String? password}) async {
    setloading(true);
    try{
      final user = await FirebaseReferences().auth.
      signInWithEmailAndPassword(email: email!, password: password!).then((value){
        setloading(false);
        Get.off(HomePage());
      }).catchError((e){
        setloading(false);
        Utils.toastMessage(Icons.error, AppColors.darkRedColor, e.toString().replaceAll(RegExp(r'\[.*?\]'), ''), context!);
      });
      setloading(false);
    }catch(e){
      setloading(false);
      Utils.toastMessage(Icons.error, AppColors.darkRedColor, e.toString().replaceAll(RegExp(r'\[.*?\]'), ''), context!);
    }
  }

}