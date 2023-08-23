import 'package:flutter/material.dart';
import 'package:police_complaint_app/screens/complaintStatus.dart';
import 'package:police_complaint_app/screens/addStation.dart';
import 'package:police_complaint_app/widgets/stationModel.dart';
import 'package:police_complaint_app/widgets/toptext.dart';

import '../constant/colors.dart';

class ShowAllStations extends StatelessWidget {
  const ShowAllStations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopText(headerText: 'All Stations'),
        Expanded(
          child: Stack(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  childAspectRatio: 1 / 1.23,
                ),
                itemCount: allStations.length,
                itemBuilder: (context, index) {
                  final showdata = allStations[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddStation()),
                      );
                    },
                    child: Card(
                      elevation: 10,
                      // color: Colors.teal,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              //  height: 180,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: AssetImage(showdata.stationImage)),
                                // color: Colors.teal,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.transparent,
                              width: double.infinity,
                              child:
                                  Center(child: Text(showdata.stationName)),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              // Positioned(
              //   bottom: 0,
              //   right: 0,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //         horizontal: 10.0, vertical: 25.0),
              //     child: FloatingActionButton(
              //       onPressed: () {
              //         Navigator.push(context,MaterialPageRoute(builder: (context)=>const ComplaintStatus()));
              //       },
              //       backgroundColor: topcolor,
              //       child: const Icon(Icons.location_on_outlined),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
