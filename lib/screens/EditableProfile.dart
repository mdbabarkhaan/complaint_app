import 'package:flutter/material.dart';
import 'package:police_complaint_app/constant/app_textfiald.dart';
import 'package:police_complaint_app/screens/HomePage.dart';
import 'package:police_complaint_app/widgets/appBar.dart';

import '../constant/colors.dart';

class EditableProfile extends StatefulWidget {
  const EditableProfile({super.key});

  @override
  State<EditableProfile> createState() => _EditableProfileState();
}

class _EditableProfileState extends State<EditableProfile> {
  TextEditingController nameControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  late FocusNode myfocusnode;

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
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    icon: const Icon(Icons.arrow_back_ios))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Container(
              //  color: Colors.amber,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        InputTextField(
                          //  focusNode: myfocusnode,
                          onValidator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter a correct username';
                            }
                            return null;
                          },
                          hint: 'Enter your Name',
                          myController: nameControler,
                          keyboardType: TextInputType.text,
                          labelText: 'Name',
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                },
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  color: Colors.red,
                                  child: const Center(
                                      child: Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                 // if (_formkey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()));
                               //   }
                                },
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  color: topcolor,
                                  child: const Center(
                                      child: Text(
                                    'Save',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
