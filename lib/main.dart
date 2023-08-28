import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:police_complaint_app/constant/colors.dart';
import 'package:police_complaint_app/constants/firebase_references.dart';
import 'package:police_complaint_app/controllers/provider_controller.dart';
import 'package:police_complaint_app/screens/HomePage.dart';
import 'package:police_complaint_app/screens/public_SignIn.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
///changing
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providersController,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // colorSchemeSeed:topcolor,
          //colorScheme: ColorScheme.fromSeed(seedColor: Color(0x000063)),
          //useMaterial3: true,
        ),
        home: checkStatus(),
      ),
    );
  }

  Widget checkStatus(){
    if(FirebaseReferences().auth.currentUser.isNull){
      return PublicSignIn();
    }else{
      return HomePage();
    }
  }

}
