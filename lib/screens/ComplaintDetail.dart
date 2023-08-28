import 'package:flutter/material.dart';
import 'package:police_complaint_app/screens/HomePage.dart';
import 'package:police_complaint_app/widgets/appBar.dart';
import 'package:police_complaint_app/widgets/toptext.dart';
import '../constant/colors.dart';

class ComplaintDetail extends StatefulWidget {
  String? name, fatherName, email, cnic, mobileNo, gender, date,
      district, address, placeOfIncident, alreadyVisit, complaintType;
  ComplaintDetail({
    this.name,
    this.fatherName,
    this.email,
    this.cnic,
    this.mobileNo,
    this.gender,
    this.district,
    this.address,
    this.placeOfIncident,
    this.alreadyVisit,
    this.complaintType,
    this.date,
    super.key});

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
              child: SingleChildScrollView(
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
                      labelValue: widget.name.toString(),
                    ),
                    ComplaintDetailItem(
                      label: 'Father Name',
                      labelValue: widget.fatherName.toString(),
                    ),
                    ComplaintDetailItem(
                      label: 'Email',
                      labelValue: widget.email.toString(),
                    ),
                    ComplaintDetailItem(
                      label: 'CNIC No',
                      labelValue: widget.cnic.toString(),
                    ),
                    ComplaintDetailItem(
                      label: 'Mobile No',
                      labelValue: widget.mobileNo.toString(),
                    ),
                    ComplaintDetailItem(
                      label: 'Gender',
                      labelValue: widget.gender.toString(),
                    ),
                    ComplaintDetailItem(
                      label: 'Home District',
                      labelValue: widget.district.toString(),
                    ),
                    ComplaintDetailItem(
                      label: 'Address',
                      labelValue: widget.address.toString(),
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
                      rlabel: 'Date',
                      rlabelName: widget.date.toString(),
                    ),
                    ReportInfoItems(
                      rlabel: 'Place of Incident',
                      rlabelName: widget.placeOfIncident.toString(),
                    ),
                    ReportInfoItems(
                      rlabel: 'District of incident',
                      rlabelName: widget.district.toString(),
                    ),
                    ReportInfoItems(
                      rlabel: 'Already Visited Police Station',
                      rlabelName: widget.alreadyVisit.toString(),
                    ),
                    ReportInfoItems(
                      rlabel: 'Complaint Type',
                      rlabelName: widget.complaintType.toString(),
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
