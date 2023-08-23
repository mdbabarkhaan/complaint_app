import 'package:flutter/material.dart';
import 'package:police_complaint_app/screens/HomePage.dart';
import 'package:police_complaint_app/widgets/appBar.dart';

import '../constant/colors.dart';

class ComplaintSuccessfull extends StatefulWidget {
  const ComplaintSuccessfull({super.key});

  @override
  State<ComplaintSuccessfull> createState() => _ComplaintSuccessfullState();
}

class _ComplaintSuccessfullState extends State<ComplaintSuccessfull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Card(
            elevation: 10,
            shadowColor: topcolor,
            child: Container(
              height: 300,
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.done_all),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Complaint SuccessFull',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: topcolor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Track Your Complaint ',
                          style: TextStyle(
                              color: whitecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
