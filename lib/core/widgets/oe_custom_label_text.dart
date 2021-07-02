import 'package:flutter/material.dart';
import 'package:samba_pos_app/core/constants/global_constants.dart';

class CustomLabelText extends StatelessWidget {
  final String text;
  const CustomLabelText({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: GlobalConstant.fontColorLive, fontWeight: FontWeight.bold, fontSize: 12),
    );
  }
}
