import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_complaint_app/constant/colors.dart';
import 'package:police_complaint_app/constants/firebase_references.dart';
import 'package:police_complaint_app/screens/ComplaintDetail.dart';
import 'package:police_complaint_app/widgets/toptext.dart';
// import 'package:linear_progress_bar/linear_progress_bar.dart';

class ComplaintStatus extends StatelessWidget {
  const ComplaintStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopText(headerText: 'Cheak Complaint Status'),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('complaints')
                  .where('complaintBy',isEqualTo: FirebaseReferences().auth.currentUser!.uid.toString()).snapshots(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ComplaintContainer(
                        showDate: snapshot.data!.docs[index]['date'],
                        onpreess: () {
                          Get.to(ComplaintDetail(
                            name: snapshot.data!.docs[index]['name'],
                            complaintType: snapshot.data!.docs[index]['complaintType'],
                            alreadyVisit: snapshot.data!.docs[index]['visit'],
                            placeOfIncident: snapshot.data!.docs[index]['placeOfIncident'],
                            address: snapshot.data!.docs[index]['placeOfIncident'],
                            district: snapshot.data!.docs[index]['districtOfIncident'],
                            gender: snapshot.data!.docs[index]['gender'],
                            mobileNo: snapshot.data!.docs[index]['mobileNumber'],
                            cnic: snapshot.data!.docs[index]['cnicNo'],
                            email: snapshot.data!.docs[index]['email'],
                            fatherName: snapshot.data!.docs[index]['fatherName'],
                            date: snapshot.data!.docs[index]['date'],
                          ));
                        },
                        status: snapshot.data!.docs[index]['status'] == 'reject'  ? 'Rejected' :'process',
                        child: LinearProgressIndicator(
                          color: snapshot.data!.docs[index]['status'] == 'reject' ? Colors.red: topcolor,
                          value: snapshot.data!.docs[index]['status'] == 'processing' ? 0.5 :
                          snapshot.data!.docs[index]['status'] == 'accept' ? 1.0 :
                          snapshot.data!.docs[index]['status'] == 'reject' ? 1.0 : 0.0,
                        ),
                      );
                    },
                  );
                }else{
                  return const  Center(child: CircularProgressIndicator(),);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ComplaintContainer extends StatelessWidget {
  final VoidCallback onpreess;
  final String showDate;
  final String status;
  final Widget child;
  const ComplaintContainer({
    super.key,
    required this.onpreess,
    required this.showDate,
    required this.status,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpreess,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          // height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: topcolor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                const Center(child: Text('Complaint')),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Date'),
                    Text(showDate),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Deliver'),
                    const Text('Processing'),
                    Text(status),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                child,
                const Padding(padding: EdgeInsets.only(bottom: 10))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
