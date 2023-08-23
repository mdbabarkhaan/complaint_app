import 'package:flutter/material.dart';
import 'package:police_complaint_app/constant/colors.dart';

class AppButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final IconData? icon;
  final Color? color;
  final double? height;
  final double? width;
  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.icon,
    this.color,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height:MediaQuery.of(context).size.height*0.05,
          width: width,
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style:  const TextStyle(fontSize: 16, color: whitecolor,fontWeight: FontWeight.bold),
              ),
             const SizedBox(width: 5,),
              Icon(icon,color: Colors.white,),
            ],
          ),
        ),
      ),
    );
  }
}
