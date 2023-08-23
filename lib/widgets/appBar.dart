import 'package:flutter/material.dart';
import 'package:police_complaint_app/constant/colors.dart';

PreferredSize customAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(150.0),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: topcolor,
          ),
        ),
        Positioned(
          left: 120,
          bottom: -60,
            child: SizedBox(
                height: 120,
                child: Image.asset('assets/images/policelogo.png'))),
      ],

    ),
  );
}
