import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GeneralToast{
  String mas;

  GeneralToast(this.mas);

  Future toast(){
    return Fluttertoast.showToast(
        msg: mas,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}
