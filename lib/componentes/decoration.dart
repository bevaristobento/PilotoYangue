import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

InputDecoration getAuthenticationInputDecoration(String label)
{
  return InputDecoration
  (
    hintText:label ,
    fillColor:const Color.fromARGB(255, 231, 228, 228) ,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),

    border: const OutlineInputBorder
    (
      borderRadius:BorderRadius.only

      (
        topLeft:Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),

    enabledBorder: const OutlineInputBorder
    (
      borderRadius:BorderRadius.only

      (
        topLeft:Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      borderSide: BorderSide(color: Colors.black,width: 1),
      ),

      focusedBorder: const OutlineInputBorder
      (
         borderRadius:BorderRadius.only

      (
        topLeft:Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      borderSide: BorderSide
      (color:  Color.fromARGB(179, 30, 5, 172),width: 2),
      ),


      errorBorder: const OutlineInputBorder
      (
         borderRadius:BorderRadius.only

      (
        topLeft:Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      borderSide: BorderSide
      (color:  Color.fromARGB(255, 241, 12, 12),width: 1),

  ),


  focusedErrorBorder: const OutlineInputBorder
      (
         borderRadius:BorderRadius.only

      (
        topLeft:Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      borderSide: BorderSide
      (color: Color.fromARGB(255, 241, 12, 12),width: 2),
      ),
  );
}