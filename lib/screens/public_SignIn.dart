import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_complaint_app/controllers/login_controller.dart';
import 'package:police_complaint_app/screens/public_SignUp.dart';
import 'package:police_complaint_app/widgets/app_button.dart';
import 'package:provider/provider.dart';
import '../constant/app_textfiald.dart';
import '../constant/colors.dart';
import '../widgets/appBar.dart';

class PublicSignIn extends StatefulWidget {
  const PublicSignIn({super.key});

  @override
  State<PublicSignIn> createState() => _PublicSignInState();
}

class _PublicSignInState extends State<PublicSignIn> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  late FocusNode myfocusnode;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myfocusnode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myfocusnode.dispose();
    emailControler.dispose();
    passwordControler.dispose();
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (emailRegExp.hasMatch(value)) {
      return null;
    }
    return 'please enter a valid email';
  }

  final double height = 1.0;

  @override
  Widget build(BuildContext context) {
    final signInController = Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                      key: _formkey,
                      child: Column(
                        children: [
                         const SizedBox(height: 65),
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
                            height: 20,
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
                            keyboardType: TextInputType.emailAddress,
                            labelText: 'Password',
                            obsureText: true,
                            prefixIcon: Icons.person,

                            //suffixIcon: Icons.person,
                            // autoFocus: true,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      )),
                  Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: topcolor),
                          ))),
                  Consumer<LoginController>(
                    builder: (context, value, child) {
                      return value.loading ? Center(
                        child: CircularProgressIndicator(),
                      ) : AppButton(
                        height: 50,
                        color: topcolor,
                        width: double.infinity,
                        onTap: () {
                          if(_formkey.currentState!.validate()){
                            signInController.userLogin(context: context,email: emailControler.text,password: passwordControler.text);
                          }
                        },
                        text: 'Sign In',
                        icon: Icons.arrow_forward,
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an Account?",
                        style: TextStyle(
                            color: Colors.black, fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () {
                         Get.off(PublicSignUp());
                        },
                        child: const Text('Register',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blueAccent,
                                fontSize: 15)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
