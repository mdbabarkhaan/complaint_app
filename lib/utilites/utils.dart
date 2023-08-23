import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void fieldFocus(
      BuildContext context, FocusNode currentNode, FocusNode nextFocus) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  tagHeading(String t){
    return Padding(
      padding: EdgeInsets.only(top: 3,bottom: 3),
      child: Text(t,style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25
      ),),
    );
  }


  /// Toast
  static toastMessage(IconData icon, Color iconColor, String message, BuildContext context) {
    // return Fluttertoast.showToast(
    //     msg: message,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0,
    // );
   return Flushbar(
     message: message,
     duration: const Duration(seconds: 3),
     margin: const EdgeInsets.all(20),
     borderRadius: BorderRadius.circular(10),
     icon: Icon(icon,color: iconColor),
     forwardAnimationCurve: Curves.fastOutSlowIn,
     reverseAnimationCurve: Curves.easeOut,
    )..show(context);
  }

  ///Call dial
  Future<void> dialCall(String number) async {
    String phoneNumber = number.toString();
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }


  /// get current location
  Future<Position> getUserCurrentLocation(BuildContext context) async {
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace){
      toastMessage(Icons.error, Colors.white, "please allow your current location", context);
    });
    return await Geolocator.getCurrentPosition();
  }


  alertDialog({BuildContext? context,VoidCallback? onPressed, String? text}){
    return showDialog(
        context: context!,
        builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text("Alert"),
            content: Text(text!),
            actions: [
              CupertinoDialogAction(child: Text("Close"),onPressed: () => Get.back(),),
              CupertinoDialogAction(isDefaultAction: true, child: Text("Confirm"),onPressed: onPressed),
            ]));
  }

}
