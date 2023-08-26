import 'package:flutter/material.dart';
import 'package:police_complaint_app/constants/app_text_style.dart';

class AppBars {
  customAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 35,right: 10,left: 10),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("BOOK AN\nAMBULANCE",style: AppTextStyle.extraLargeTextStyle(),),
              SizedBox(
                width: 110,
                child: Image.asset("assets/images/ambulanceImage.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
