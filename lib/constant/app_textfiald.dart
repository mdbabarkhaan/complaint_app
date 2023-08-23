import 'package:flutter/material.dart';

import 'colors.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController myController;
//  final FocusNode focusNode;
  // final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidator;

  final TextInputType keyboardType;
  final String hint;
  final bool obsureText;
  final String labelText;
  final bool enable, autoFocus;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? suffixIconOnpressed;
  final int? lenght;
  const InputTextField({
    super.key,
    this.lenght,
    required this.myController,
    // required this.focusNode,
    //required this.onFieldSubmittedValue,
    required this.keyboardType,
    required this.obsureText,
    required this.hint,
    this.enable = true,
    required this.onValidator,
    this.autoFocus = false,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconOnpressed,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: myController,
        //   focusNode: focusNode,
        //  onFieldSubmitted: onFieldSubmittedValue,
        maxLength: lenght,
        validator: onValidator,
        keyboardType: keyboardType,
        obscureText: obsureText,
        enabled: enable,
        cursorColor: whitecolor,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          // fillColor: Colors.black26,
          prefixIcon: Icon(prefixIcon!, color: Colors.black38),
          suffixIcon: IconButton(
              icon: Icon(suffixIcon, color: Colors.black38),
              onPressed: suffixIconOnpressed),
          hintText: hint,
          contentPadding: const EdgeInsets.all(10),
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(height: 0, color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.green,
              )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class TextFormFiald extends StatelessWidget {
//   final TextEditingController myController;
//   final FocusNode focusNode;
//   final bool obsureText;
//   final String hint;
//   final String labelText;
//   final IconData? prefixIcon;
//   final IconData? suffixIcon;
//   final bool enable, autoFocus;
//   const TextFormFiald({
//     super.key,
//     required this.myController,
//     required this.focusNode,
//     required this.obsureText,
//     required this.hint,
//     required this.labelText,
//     this.prefixIcon,
//     this.suffixIcon,
//     required this.enable, required this.autoFocus,
//    // required this.autoFocus, required this.emailControler,
//   });

//   //final TextEditingController emailControler;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: myController,
//       focusNode: FocusNode(),
//      // keyboardType: TextInputType.emailAddress,
//       decoration: InputDecoration(
//         hintText: hint,
//         labelText: labelText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Colors.greenAccent),
//         ),
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.greenAccent),
//             borderRadius: const BorderRadius.all(Radius.circular(8))),
//         errorBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.redAccent),
//             borderRadius: const BorderRadius.all(Radius.circular(8))),
//         enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.blueAccent),
//             borderRadius: const BorderRadius.all(Radius.circular(8))),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'please enter a valid email';
//         }
//         return null;
//       },
//     );
//   }
// }
