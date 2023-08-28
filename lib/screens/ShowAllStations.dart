import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:police_complaint_app/screens/addStation.dart';
import 'package:police_complaint_app/widgets/stationModel.dart';
import 'package:police_complaint_app/widgets/toptext.dart';

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
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('stations').snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        childAspectRatio: 1 / 1.23,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final showdata = allStations[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddStation(
                                    name: snapshot.data!.docs[index]['name'],
                                    imageUrl: snapshot.data!.docs[index]['imageUrl'],
                                    id: snapshot.data!.docs[index]['id'],
                                    address: snapshot.data!.docs[index]['address'],
                                  )),
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
                                          fit: BoxFit.cover,
                                          image: NetworkImage(snapshot.data!.docs[index]['imageUrl'])),
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
                                    Center(child: Column(
                                      children: [
                                        Text(snapshot.data!.docs[index]['name']),
                                        Text(snapshot.data!.docs[index]['address']),
                                      ],
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }else{
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
