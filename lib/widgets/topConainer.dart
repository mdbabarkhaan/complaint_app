
import 'package:flutter/material.dart';
import 'package:police_complaint_app/constant/colors.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration:const BoxDecoration(
        color: topcolor,
        // borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(30.r),
        //     bottomRight: Radius.circular(30.r))
      ),
    );
  }
}
