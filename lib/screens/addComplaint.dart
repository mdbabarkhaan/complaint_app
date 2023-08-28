import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:police_complaint_app/constant/app_textfiald.dart';
import 'package:police_complaint_app/constant/colors.dart';
import 'package:police_complaint_app/controllers/complaint_controller.dart';
import 'package:police_complaint_app/utilites/utils.dart';
import 'package:police_complaint_app/widgets/appBar.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../constants/district_list.dart';
import '../widgets/app_button.dart';
import 'dart:io';


class AddComplaint extends StatefulWidget {
  String? name;
  String? id;
  String? imageUrl;
  AddComplaint({this.name, this.id, this.imageUrl,super.key});

  @override
  State<AddComplaint> createState() => _AddComplaintState();
}

class _AddComplaintState extends State<AddComplaint> {
  late FocusNode myfocusnode;
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
  final _formkey = GlobalKey<FormState>();

  String? selectedDistricts;
  File? coverImages;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myfocusnode = FocusNode();
    dateTimeControler.text = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
    setState(() {});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top:80.0,bottom: 15,right: 15,left: 15),
        child: SingleChildScrollView(
          child: Form(
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
                const  SizedBox(height: 10.0),
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
                const  SizedBox(height: 10.0),
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
                const  SizedBox(height: 10.0),
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
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint:  Row(
                      children: [
                        Icon(
                          Icons.list,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Select your Districts',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(height: 0, color: AppColors.whiteColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: Districts().district_list
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                    value: selectedDistricts,
                    onChanged: (String? value) {
                      setState(() {
                        selectedDistricts = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(
                        //   color: Colors.black26,
                        // ),
                        color: Colors.grey,
                      ),
                      elevation: 0,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColors.darkRedColor,
                      ),
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
                const  SizedBox(height: 10.0),
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
                const  SizedBox(height: 10.0),
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
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Attachment'),
                    GestureDetector(
                      onTap: ()=> coverPagePickImages(),
                      child: Row(
                        children: [
                         coverImages == null  ? const Icon(Icons.attachment) : const Icon(Icons.check,color: Colors.green,)  ,
                          coverImages == null ? const Text('Select File') : const Text('Successfully')
                        ],
                      ),
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

                const  SizedBox(height: 10.0),
                Consumer<ComplaintController>(
                  builder: (context, value, child) {
                    return value.loading ?
                        const Center(child: CircularProgressIndicator())
                        : AppButton(
                      height: MediaQuery.of(context).size.height * 0.05,
                      onTap: () {
                        if(_formkey.currentState!.validate()){
                          if(coverImages  != null){
                            if(selectedDistricts!.isNotEmpty){
                              value.userSignUp(
                                  name: usernameControler.text,
                                  context: context,
                                  cnicNo: cnicControler.text,
                                  date: dateTimeControler.text,
                                  details: complaintDetailControler.text,
                                  district: selectedDistricts,
                                  fatherName: fathernameControler.text,
                                  gender: genderControler.text,
                                  mobileNo: phoneNoControler.text,
                                  place: placeControler.text,
                                  type: complaintTypeControler.text,
                                  visit: alreadyVisitControler.text,
                                  file: coverImages,
                                  stationId: widget.id,
                                  stationName: widget.name
                              );
                            }else{
                              Utils.toastMessage(Icons.error, Colors.red, "Please select the district", context);
                            }
                          }else{
                            Utils.toastMessage(Icons.error, Colors.red, "Please add the case picture", context);
                          }
                        }
                      },
                      text: 'Submit Complaint',
                      color: topcolor,
                    );
                  },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> coverPagePickImages({String? bookName}) async {
    XFile? fil = await _picker.pickImage(source: ImageSource.gallery);
    if(fil!.path.isNotEmpty){
      setState(() {
        coverImages = File(fil.path);
      });
    }
  }
}
