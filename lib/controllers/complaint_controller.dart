import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/firebase_references.dart';
import '../utilites/utils.dart';

class ComplaintController with ChangeNotifier{
  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  userSignUp({BuildContext? context, String? name, fatherName, cnicNo, mobileNo, gender,
    date, place, district, visit, type, details
  }) async {
    setloading(true);
    try{
      final res  = await FirebaseReferences().complaintsReference.add({
        'email' : FirebaseReferences().auth.currentUser!.email.toString(),
        'name' : name,
        'status' : 'processing',
        'fatherName' : fatherName,
        'cnicNo' : cnicNo,
        'mobileNumber' : mobileNo,
        'gender' : gender,
        'date' : date,
        'placeOfIncident' : place,
        'districtOfIncident' : district,
        'visit' : visit,
        'complaintType': type,
        'complaintDetails': details,
      }).then((value) async {
        value.update({
          'id' : value.id
        }).then((value){
          /// go to the screen
          setloading(false);
          Utils.toastMessage(Icons.check, Colors.green, "SignUp Successfully", context!);
        });
      }).catchError((e){
        setloading(false);
        Utils.toastMessage(Icons.error, AppColors.darkRedColor, e.toString().replaceAll(RegExp(r'\[.*?\]'), ''), context!);
      });
    }catch(e){
      setloading(false);
      Utils.toastMessage(Icons.error, AppColors.darkRedColor, e.toString().replaceAll(RegExp(r'\[.*?\]'), ''), context!);
    }
  }
}