import 'package:flutter/material.dart';

import '../constant/app_textfiald.dart';

class TabBarwidget extends StatefulWidget {
  const TabBarwidget({super.key});

  @override
  TabBarwidgetState createState() => TabBarwidgetState();
}

class TabBarwidgetState extends State<TabBarwidget> {
  TextEditingController usernameControler = TextEditingController();
  TextEditingController fathernameControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController cnicControler = TextEditingController();
  TextEditingController phoneNoControler = TextEditingController();
  TextEditingController genderControler = TextEditingController();
  TextEditingController dateTimeControler = TextEditingController();
  TextEditingController placeControler = TextEditingController();
  TextEditingController districtControler = TextEditingController();
  TextEditingController alreadyVisitControler = TextEditingController();

  TextEditingController complaintTypeControler = TextEditingController();
  TextEditingController complaintDetailControler = TextEditingController();

  late FocusNode myfocusnode;
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myfocusnode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myfocusnode.dispose();
    usernameControler.dispose();
    fathernameControler.dispose();
    emailControler.dispose();
    passwordControler.dispose();
    cnicControler.dispose();
    phoneNoControler.dispose();
    genderControler.dispose();
    dateTimeControler.dispose();
    placeControler.dispose();
    districtControler.dispose();
    alreadyVisitControler.dispose();
    complaintTypeControler.dispose();
    complaintDetailControler.dispose();
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (emailRegExp.hasMatch(value)) {
      return 'please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          const TabBarHeader(),
          tabBarBody(context),
        ],
      ),
    
    );
  }

  Expanded tabBarBody(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          // first tab bar view widget
          detailComplaint(context),
          reporInformatio(context),
        ],
      ),
    );
  }

  Padding reporInformatio(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(10.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Form(
           // key: _formkey,
            child: Column(
              children: [
                InputTextField(
                  //  focusNode: myfocusnode,
                  onValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Select Date & Time';
                    }
                    return null;
                  },
                  hint: 'Select Date & Time',
                  myController: dateTimeControler,
                  keyboardType: TextInputType.text,
                  labelText: 'Date & Time',
                  obsureText: false,
                  prefixIcon: Icons.person,
                  //suffixIcon: Icons.person,
                  autoFocus: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                InputTextField(
                  //  focusNode: myfocusnode,
                  onValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Place of Incident';
                    }
                    return null;
                  },
                  hint: 'Place of Incident',
                  myController: placeControler,
                  keyboardType: TextInputType.text,
                  labelText: 'Place of Incident',
                  obsureText: false,
                  prefixIcon: Icons.person,
                  //suffixIcon: Icons.person,
                  autoFocus: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                InputTextField(
                  //  focusNode: myfocusnode,
                  onValidator: ((value) {
                    if (value == null || value.isEmpty) {
                      return 'Selet your District ';
                    }
                    return null;
                  }),
                  hint: 'District of Insident ',
                  myController: districtControler,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'District of insident',
                  obsureText: false,
                  prefixIcon: Icons.person,
                  //suffixIcon: Icons.person,
                  autoFocus: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                InputTextField(
                  //  focusNode: myfocusnode,
                  onValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Already Visite Police Station ';
                    }
                    return null;
                  },
                  hint: 'Already Visite Police Station ',
                  myController: alreadyVisitControler,
                  keyboardType: TextInputType.text,
                  labelText: 'Already Visite Police Station',
                  obsureText: false,
                  prefixIcon: Icons.person,
                  //suffixIcon: Icons.person,
                  autoFocus: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                InputTextField(
                  //  focusNode: myfocusnode,
                  onValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Complaint Type ';
                    }
                    return null;
                  },
                  hint: 'Complaint Type',
                  myController: complaintTypeControler,
                  keyboardType: TextInputType.text,
                  labelText: 'Complaint Type',
                  obsureText: false,
                  prefixIcon: Icons.phone,
                  //suffixIcon: Icons.person,
                  autoFocus: true,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Attachment'),
                    Row(
                      children: [
                        Icon(Icons.attachment),
                        Text('Select File')
                      ],
                    ),
                  ],
                ),
                InputTextField(
                  //  focusNode: myfocusnode,
                  onValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Complaint Detail ';
                    }
                    return null;
                  },
                  hint: 'Complaint Detail',
                  myController: complaintDetailControler,
                  keyboardType: TextInputType.text,
                  labelText: 'Complaint Detail',
                  obsureText: false,
                  prefixIcon: Icons.female,
                  //suffixIcon: Icons.person,
                  autoFocus: true,
                ),
           
           
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding detailComplaint(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(10.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Form(
            key: _formkey,
            child: Column(
              children: [
                InputTextField(
                  //  focusNode: myfocusnode,\
                  onValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your Name';
                    }
                    return null;
                  },
                  hint: 'Enter your Name',
                  myController: usernameControler,
                  keyboardType: TextInputType.text,
                  labelText: 'UserName',
                  obsureText: false,
                  prefixIcon: Icons.person,
                  //suffixIcon: Icons.person,
                  autoFocus: true,
                ),
              const  SizedBox(height: 10.0),
                InputTextField(
                  //  focusNode: myfocusnode,
                  onValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your Father Name';
                    }
                    return null;
                  },
                  hint: 'Enter your Father Name',
                  myController: fathernameControler,
                  keyboardType: TextInputType.text,
                  labelText: 'F/Name',
                  obsureText: false,
                  prefixIcon: Icons.person,
                  //suffixIcon: Icons.person,
                  autoFocus: true,
                ),
                const  SizedBox(height: 10.0),
                InputTextField(
                  //  focusNode: myfocusnode,
                  onValidator: _validateEmail,
                  hint: 'Enter your email',
                  myController: emailControler,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Email',
                  obsureText: false,
                  prefixIcon: Icons.person,
                  //suffixIcon: Icons.person,
                  autoFocus: true,
                ),
                const  SizedBox(height: 10.0),
                InputTextField(
                  //  focusNode: myfocusnode,
                  lenght: 13,
                  onValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your CNIC number ';
                    }
                    return null;
                  },
                  hint: 'Enter your CNIC NO ',
                  myController: cnicControler,
                  keyboardType: TextInputType.text,
                  labelText: 'CNIC NO :',
                  obsureText: false,
                  prefixIcon: Icons.person,

                  //suffixIcon: Icons.person,
                  autoFocus: true,
                ),
                const  SizedBox(height: 10.0),
                InputTextField(
                  //  focusNode: myfocusnode,
                  lenght: 11,
                  onValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Phone Number ';
                    }
                    return null;
                  },
                  hint: 'Mobile Number ',
                  myController: phoneNoControler,
                  keyboardType: TextInputType.text,
                  labelText: 'Mobile Number',
                  obsureText: true,
                  prefixIcon: Icons.phone,
                  //suffixIcon: Icons.person,
                  autoFocus: true,
                ),
                InputTextField(
                  //  focusNode: myfocusnode,
                  onValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Select Your Status ';
                    }
                    return null;
                  },
                  hint: 'Gender',
                  myController: genderControler,
                  keyboardType: TextInputType.text,
                  labelText: 'Gender',
                  obsureText: false,
                  prefixIcon: Icons.female,
                  //suffixIcon: Icons.person,
                  autoFocus: true,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarHeader extends StatelessWidget {
  const TabBarHeader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: const TabBar(
        tabs: [
          Tab(
            text: 'Complaint Details',
          ),
          Tab(
            text: 'Information Report',
          ),
        ],
      ),
    );
  }
}
