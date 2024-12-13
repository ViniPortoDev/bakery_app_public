import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/text_style.dart';


// ignore: must_be_immutable
class CustomSearchTextField extends StatefulWidget {
  String label;
  String hint;
  TextEditingController controller;
  Function? validator;
  Function(String)? onChanged;
  //var onChanged;
  bool password;
  bool visibility;
  IconButton? suffixIcon;

  CustomSearchTextField(
      {
      required this.label,
      required this.hint,
      required this.controller,
      this.validator,
      this.onChanged,
      this.password = false,
      this.suffixIcon,
      this.visibility = false,
      //this.onChanged
      }
    );

  @override
  _CustomSearchTextFieldState createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    //var height = MediaQuery.of(context).size.height;
    return Container(
      //padding: EdgeInsets.only(top: 10,/*height * 0.02*/),
      child: TextFormField(
        controller: this.widget.controller,
        obscureText: this.widget.visibility,
        keyboardType: TextInputType.emailAddress,
        validator: (value) => widget.validator!(value),
        //onChanged: this.widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: this.widget.hint,
          hintStyle: TextStyle(color: AppColors.bege),
          prefixIcon: this.widget.suffixIcon,
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
        onChanged: this.widget.onChanged,
      ),
    );
  }
}
