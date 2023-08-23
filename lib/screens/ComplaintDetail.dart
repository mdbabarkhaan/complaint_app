import 'package:flutter/material.dart';
import 'package:police_complaint_app/screens/HomePage.dart';
import 'package:police_complaint_app/widgets/appBar.dart';
import 'package:police_complaint_app/widgets/toptext.dart';
import '../constant/colors.dart';

class ComplaintDetail extends StatefulWidget {
  const ComplaintDetail({super.key});

  @override
  State<ComplaintDetail> createState() => _ComplaintDetailState();
}

class _ComplaintDetailState extends State<ComplaintDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  icon: const Icon(Icons.arrow_back_ios))),
          const TopText(headerText: 'Complaint Details'),
          const Divider(),
          Expanded(
            child: Container(
              width: double.infinity,
              //color: Colors.amber,
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Complaint Details',
                      style: TextStyle(
                          color: topcolor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    ComplaintDetailItem(
                      label: 'Name',
                      labelValue: 'abc',
                    ),
                    ComplaintDetailItem(
                      label: 'Father Name',
                      labelValue: 'abc',
                    ),
                    ComplaintDetailItem(
                      label: 'Email',
                      labelValue: 'abc',
                    ),
                    ComplaintDetailItem(
                      label: 'CNIC No',
                      labelValue: 'abc',
                    ),
                    ComplaintDetailItem(
                      label: 'Mobile No',
                      labelValue: 'abc',
                    ),
                    ComplaintDetailItem(
                      label: 'Gender',
                      labelValue: 'abc',
                    ),
                    ComplaintDetailItem(
                      label: 'Country',
                      labelValue: 'abc',
                    ),
                    ComplaintDetailItem(
                      label: 'Province',
                      labelValue: 'abc',
                    ),
                    ComplaintDetailItem(
                      label: 'Home District',
                      labelValue: 'abc',
                    ),
                    ComplaintDetailItem(
                      label: 'Address',
                      labelValue: 'abc',
                    ),
                  
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Information Report',
                        style: TextStyle(
                            color: topcolor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ReportInfoItems(
                      rlabel: 'Date/Time of Incident',
                      rlabelName: 'Date:12/08/2023 Time 03:00 PM',
                    ),
                    ReportInfoItems(
                      rlabel: 'Place of Incident',
                      rlabelName: 'ABC',
                    ),
                    ReportInfoItems(
                      rlabel: 'District of incident',
                      rlabelName: 'ABC',
                    ),
                    ReportInfoItems(
                      rlabel: 'Already Visited Police Station',
                      rlabelName: 'ABC',
                    ),
                    ReportInfoItems(
                      rlabel: 'Complaint Type',
                      rlabelName:
                          'Date:12/08/2023 Time 03:00 PM show all the sentance about the complaint report',
                    ),

                    //       //
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ComplaintDetailItem extends StatelessWidget {
  final String label;
  final String labelValue;
  const ComplaintDetailItem({
    super.key,
    required this.label,
    required this.labelValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal:10.0,vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(labelValue),
        ],
      ),
    );
  }
}

class ReportInfoItems extends StatelessWidget {
  final String rlabel;
  final String rlabelName;
  const ReportInfoItems({
    super.key,
    required this.rlabel,
    required this.rlabelName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(rlabel),
          Text(rlabelName),
        ],
      ),
    );
  }
}
