import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:police_complaint_app/constants/firebase_references.dart';

import '../constant/policeStationsDetails.dart';
import 'addStation.dart';

class NearStations extends StatefulWidget {
  const NearStations({super.key});

  @override
  State<NearStations> createState() => _NearStationsState();
}

class _NearStationsState extends State<NearStations> {
  
  String? userLocation;
  
  getlocation(){
    FirebaseFirestore.instance.collection('users').doc(FirebaseReferences().auth.currentUser!.uid).get().then((value){
      setState(() {
        userLocation = value['district'];
      });
    });
  }

  @override
  void initState() {
    getlocation();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 70),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('stations').where('district',isEqualTo: userLocation).snapshots(),
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
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(snapshot.data!.docs[index]['imageUrl']),
                                    ),
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
                  return Center(child: CircularProgressIndicator());
                }
              },
            )
          ),
        ],
      ),
    );
  }
}
