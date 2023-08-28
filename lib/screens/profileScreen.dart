import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_complaint_app/constant/colors.dart';
import 'package:police_complaint_app/constants/firebase_references.dart';
import 'package:police_complaint_app/screens/ComplaintDetail.dart';
import 'package:police_complaint_app/screens/EditableProfile.dart';
import 'package:police_complaint_app/screens/addComplaint.dart';
import 'package:police_complaint_app/screens/complaintStatus.dart';
import 'package:police_complaint_app/screens/public_SignIn.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String email = "";

  getdata(){
    FirebaseFirestore.instance.collection('users').doc(FirebaseReferences().auth.currentUser!.uid).get().then((value){
      setState(() {
        email = value['email'];
      });
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 80)),
        // const Text('Afaq Ali',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        Text(email,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        const Padding(padding: EdgeInsets.only(top: 10)),
        Expanded(
          child: Container(
              width: double.infinity,
            //  color: Colors.amber,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(context,MaterialPageRoute(builder: (context) => const EditableProfile()));
                    //   },
                    //   child:const ProfileItem(
                    //       icon: Icons.person,
                    //       title: 'Edit Profile',
                    //     ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        Get.to(ComplaintStatus());
                      },
                      child: const ProfileItem(
                        icon: Icons.track_changes,
                        title: 'Track Your Complaints',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ComplaintDetail()),
                        );
                      },
                      child: const ProfileItem(
                        icon: Icons.question_mark,
                        title: 'help',
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: GestureDetector(
                          onTap: () {
                            FirebaseReferences().auth.signOut().then((value) => Get.off(const PublicSignIn()));
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout),
                              SizedBox(width: 5),
                              Text('LogOut')
                            ],
                          ),
                      ),
                    ),

                  ],
                ),
              )
              ),
        ),
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  // final Function onpressed;
  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    // required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        margin:const EdgeInsets.symmetric(vertical: 5.0),
        decoration:const  BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromARGB(255, 237, 235, 235),
        ),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title,style:const TextStyle(color: topcolor),),
          trailing:const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
