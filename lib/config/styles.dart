import 'package:flutter/material.dart';

class CommonTextStyle {
  static const textStyleNormal = TextStyle(
    color: Colors.black54,
    fontSize: 24.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );
}

class CommonButtonStyle {
  static final buttonStyleNormal = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: Colors.blue),
      ),
    ),
  );
}
