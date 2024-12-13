import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text_style.dart';


// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  String label;
  String hint;
  TextEditingController controller;
  Function validator;
  //var onChanged;
  bool password;
  bool visibility;
  IconButton? suffixIcon;

  CustomTextField(
      {required this.label,
      required this.hint,
      required this.controller,
      required this.validator,
      this.password = false,
      this.suffixIcon,
      this.visibility = false,
      //this.onChanged
      }
    );

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: height * 0.03),
      child: TextFormField(
        controller: this.widget.controller,
        obscureText: this.widget.visibility,
        keyboardType: TextInputType.emailAddress,
        validator: (value) => widget.validator(value),
        //onChanged: this.widget.onChanged,
        decoration: InputDecoration(
          labelText: this.widget.label,
          hintText: this.widget.hint,
          labelStyle: TextStyle(color: AppColors.bege),
          hintStyle: TextStyle(color: AppColors.bege),
          suffixIcon: this.widget.password ? this.widget.suffixIcon : null,
          focusedBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(width * 0.058),
              borderSide: BorderSide(color: AppColors.bege)),
          enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(width * 0.058),
              borderSide: BorderSide(color: AppColors.bege)),
          border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(width * 0.058),
              borderSide: BorderSide(color: AppColors.bege)),
        ),
        style: StyleText.textField,
      ),
    );
  }
}
