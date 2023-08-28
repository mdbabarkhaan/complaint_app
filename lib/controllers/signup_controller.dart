import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_complaint_app/constants/app_colors.dart';
import 'package:police_complaint_app/constants/firebase_references.dart';
import 'package:police_complaint_app/screens/HomePage.dart';
import 'package:police_complaint_app/utilites/utils.dart';

class SignupController with ChangeNotifier{

  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  userSignUp({BuildContext? context, String? email, String? name, String? password, String? district}) async {
    setloading(true);
   try{
     UserCredential? userCredential = await FirebaseReferences().auth.
     createUserWithEmailAndPassword(email: email!, password: password!).then((valuee) async {
       int rehabNameCount = email.length;
       List data = [];
       String temp = "";
       print(rehabNameCount);
       for(int i=0; i<rehabNameCount; i++) {
         temp = temp + email[i].toLowerCase();
         data.add(temp);
       }
       final res  = await FirebaseReferences().usersReference.doc(valuee.user!.uid).set({
         'id' : valuee.user!.uid,
         'email' : email,
         'name' : name,
         'status' : 'active',
         'emailForSearch' : data,
         'district' : district,
       }).then((value) async {
         Get.off(HomePage());
         setloading(false);
         Utils.toastMessage(Icons.check, Colors.green, "SignUp Successfully", context!);
       }).catchError((e){
         setloading(false);
         Utils.toastMessage(Icons.error, AppColors.darkRedColor, e.toString().replaceAll(RegExp(r'\[.*?\]'), ''), context!);
       });
     }).catchError((e){
       setloading(false);
       Utils.toastMessage(Icons.error, AppColors.darkRedColor, e.toString().replaceAll(RegExp(r'\[.*?\]'), ''), context!);
     });
     // setloading(false);
   }catch(e){
     setloading(false);
     Utils.toastMessage(Icons.error, AppColors.darkRedColor, e.toString().replaceAll(RegExp(r'\[.*?\]'), ''), context!);
   }
  }
}