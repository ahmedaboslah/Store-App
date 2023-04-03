import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  
  String? HintText;
  Function(String)? onChange;
  bool obscure;
  TextInputType? inputType;
  CustomTextField({this.HintText,this.onChange,required this.obscure, this.inputType});
  @override
  Widget build(BuildContext context) {
    return TextField(
     
      style: TextStyle(color: Colors.black),
      obscureText:obscure ,
      keyboardType: inputType,
      onChanged: onChange,
      decoration: InputDecoration(
        label: Text('$HintText',style: TextStyle(color: Colors.black),),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
          ),
          borderRadius: BorderRadius.circular(8)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
           borderRadius: BorderRadius.circular(8)
          
        ),
      ),
    );
  }
}
