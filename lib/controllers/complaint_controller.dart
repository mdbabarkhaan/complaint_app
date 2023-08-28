import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import '../constants/app_colors.dart';
import '../constants/firebase_references.dart';
import '../screens/ComplaintSuccessfull.dart';
import '../utilites/utils.dart';

class ComplaintController with ChangeNotifier{

  final FirebaseStorage _storage = FirebaseStorage.instance;

  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  userSignUp({BuildContext? context, String? name, fatherName, cnicNo, mobileNo, gender,
    date, place, district, visit, type, details, File? file, String? stationName, stationId
  }) async {
    setloading(true);
    try{
      final ref = _storage.ref().child(const Uuid().v4());
      await ref.putFile(file!).then((p0){});
      final String downloadUrl = await ref.getDownloadURL();
      await FirebaseReferences().complaintsReference.add({
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
        'image' : downloadUrl,
        'stationName' : stationName,
        'stationId' : stationId,
        'complaintBy' : FirebaseReferences().auth.currentUser!.uid,
      }).then((value) async {
        value.update({
          'id' : value.id
        }).then((value){
          Get.off(ComplaintSuccessfull());
          setloading(false);
          Utils.toastMessage(Icons.check, Colors.green, "Case Register Successfully", context!);
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