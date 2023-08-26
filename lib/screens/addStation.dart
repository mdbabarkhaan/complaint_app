import 'package:flutter/material.dart';
import 'package:police_complaint_app/screens/HomePage.dart';
import 'package:police_complaint_app/screens/addComplaint.dart';
import 'package:police_complaint_app/widgets/appBar.dart';
import 'package:police_complaint_app/widgets/app_button.dart';
import 'package:police_complaint_app/widgets/toptext.dart';

import '../constant/colors.dart';

class AddStation extends StatefulWidget {
  const AddStation({super.key});

  @override
  State<AddStation> createState() => _AddStationState();
}

class _AddStationState extends State<AddStation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        children: [
          const TopText(headerText: 'Add Police Station'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              // color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.asset('assets/images/station.jpg'),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Text('Station Name'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Text('Address'),
                    ],
                  ),
                  AppButton(
                    height: MediaQuery.of(context).size.height * 0.05,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddComplaint()));
                    },
                    text: 'Add Complaint',
                    color: topcolor,
                  ),
                  AppButton(
                    height: MediaQuery.of(context).size.height * 0.05,
                    color: Colors.redAccent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    text: 'Quit',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
