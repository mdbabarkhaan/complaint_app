import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_complaint_app/constant/app_textfiald.dart';
import 'package:police_complaint_app/screens/public_SignIn.dart';
import 'package:police_complaint_app/widgets/appBar.dart';
import 'package:police_complaint_app/widgets/app_button.dart';
import 'package:police_complaint_app/widgets/toptext.dart';
import 'package:provider/provider.dart';

import '../constant/colors.dart';
import '../controllers/signup_controller.dart';

class PublicSignUp extends StatefulWidget {
  const PublicSignUp({super.key});

  @override
  State<PublicSignUp> createState() => _PublicSignUpState();
}

class _PublicSignUpState extends State<PublicSignUp> {
  TextEditingController usernameControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController confirmPasswordCantroler = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  late FocusNode myfocusnode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myfocusnode = FocusNode();
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myfocusnode.dispose();
    usernameControler.dispose();
    emailControler.dispose();
    passwordControler.dispose();
    confirmPasswordCantroler.dispose();
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (emailRegExp.hasMatch(value)) {
      return 'please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final signUpController = Provider.of<SignupController>(context,listen: false);
    return Scaffold(
      appBar: customAppBar(),
      body: Column(children: [
        const TopText(headerText: 'Police Station'),
        Expanded(
          child: Container(
         //   color: Colors.amber,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          InputTextField(
                            //  focusNode: myfocusnode,
                            onValidator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Name';
                              }
                              return null;
                            },
                            hint: 'Enter your Name',
                            myController: usernameControler,
                            keyboardType: TextInputType.text,
                            labelText: 'UserName',
                            obsureText: false,
                            prefixIcon: Icons.person,
                            //suffixIcon: Icons.person,
                            autoFocus: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InputTextField(
                            //  focusNode: myfocusnode,
                            onValidator: _validateEmail,
                            hint: 'Enter your email',
                            myController: emailControler,
                            keyboardType: TextInputType.emailAddress,
                            labelText: 'Email',
                            obsureText: false,
                            prefixIcon: Icons.person,
                            //suffixIcon: Icons.person,
                            autoFocus: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InputTextField(
                            //  focusNode: myfocusnode,
                            onValidator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your password';
                              }
                              return null;
                            },
                            hint: 'Enter your password',
                            myController: passwordControler,
                            keyboardType: TextInputType.text,
                            labelText: 'Password',
                            obsureText: true,
                            prefixIcon: Icons.person,
                            //suffixIcon: Icons.person,
                            autoFocus: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InputTextField(
                            //  focusNode: myfocusnode,
                            onValidator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password Not Match';
                              }
                              return null;
                            },
                            hint: 'Confirm password',
                            myController: confirmPasswordCantroler,
                            keyboardType: TextInputType.text,
                            labelText: 'Confirm Password',
                            obsureText: true,
                            prefixIcon: Icons.person,
                            //suffixIcon: Icons.person,
                            autoFocus: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                   Consumer<SignupController>(
                     builder: (context, value, child) {
                       return value.loading ? const Center(child: CircularProgressIndicator()) : AppButton(
                         height: 50,
                         color: topcolor,
                         onTap: () {
                           signUpController.userSignUp(
                               context: context,
                               email: emailControler.text,
                               password: passwordControler.text,
                               name: usernameControler.text,
                           );
                         },
                         text: 'Sign Up',
                         icon: Icons.arrow_forward,
                       );
                     },
                   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an Account?",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.off(PublicSignIn());
                          },
                          child: const Text('Sign In',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blueAccent,
                                  fontSize: 15)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
