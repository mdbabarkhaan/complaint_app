import 'package:flutter/material.dart';
import 'package:police_complaint_app/constant/colors.dart';
import 'package:police_complaint_app/screens/ComplaintDetail.dart';
import 'package:police_complaint_app/widgets/toptext.dart';
// import 'package:linear_progress_bar/linear_progress_bar.dart';

class ComplaintStatus extends StatelessWidget {
  const ComplaintStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopText(headerText: 'Cheak Complaint Status'),
        Expanded(
          child: Container(
          //  color: Colors.amber,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ComplaintDetail()));
                    },
                    child: ComplaintContainer(
                      showDate: '12/08/2022',
                      onpreess: () {
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetail()));
                      },
                      status: 'process',
                      child: const LinearProgressIndicator(
                        color: topcolor,
                      ),
                    ),
                  ),
                  ComplaintContainer(
                    showDate: '10/09/2022',
                    onpreess: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetail()));
                    },
                    status: 'process',
                    child: const LinearProgressIndicator(
                      color: topcolor,
                    ),
                  ),
                  ComplaintContainer(
                    showDate: '12/10/2022',
                    onpreess: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetail()));
                    },
                    status: 'Complete',
                    child: const LinearProgressIndicator(
                      color: topcolor,
                    ),
                  ),
                  ComplaintContainer(
                    showDate: '01/06/2023',
                    onpreess: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetail()));
                    },
                    status: 'Complete',
                    child: const LinearProgressIndicator(
                      color: topcolor,
                    ),
                  ),
                  ComplaintContainer(
                    showDate: '15/08/2023',
                    onpreess: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetail()));
                    },
                    status: 'process',
                    child: const LinearProgressIndicator(
                      color: topcolor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ComplaintContainer extends StatelessWidget {
  final Function onpreess;
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
      onTap: onpreess(),
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
