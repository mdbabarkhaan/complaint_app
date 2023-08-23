
import 'package:flutter/material.dart';

class TopText extends StatelessWidget {
  final String headerText;
  const TopText({
    super.key, required this.headerText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:60.0,bottom: 5),
      child: Center(
        child: Text(
          headerText,
          style:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
