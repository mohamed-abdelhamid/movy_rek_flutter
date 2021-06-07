import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const TextStyle kGeneralTextFieldLabelStyle = TextStyle(
  color: Colors.grey,
  fontSize: 14.0,
);

const TextStyle kGeneralTextPickerStyle = TextStyle(
  color: Colors.black54,
  fontSize: 16.0,
);

const InputDecoration kTextFieldLabelDecoration = InputDecoration(
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    contentPadding:
    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15)
);

const TextStyle kGeneralTitleStyle = TextStyle(
  color: Colors.black54,
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);

BoxDecoration kRegistrationButtonDecoration = BoxDecoration(
  border: Border.all(color: Colors.blue),
  borderRadius: BorderRadius.circular(30),
);

BoxDecoration kRegistrationTextFieldDecoration = BoxDecoration(
  color: Colors.grey[350],
  borderRadius: BorderRadius.circular(15),
);

BoxDecoration kRegistrationDatePickerDecoration = BoxDecoration(
  color: Colors.grey[350],
  borderRadius: BorderRadius.circular(15),
);

BoxDecoration kDrawerHeaderDecoration = BoxDecoration(
  gradient: new LinearGradient(
      colors: [
        Color(0xffF2553D),
        Color(0xffF9F7F7),
      ],
      stops: [
        0.0,
        1.0
      ],
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated),
);


BoxDecoration kImageProfileDecoration = BoxDecoration(
  shape: BoxShape.circle,
  image: DecorationImage(
      image: new ExactAssetImage('assets/images/profile.jpg'),
      fit: BoxFit.fill
  ),
);