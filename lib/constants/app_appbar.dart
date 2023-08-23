import 'package:ambulance_booking/constants/app_text_style.dart';
import 'package:flutter/material.dart';

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
              Container(
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
