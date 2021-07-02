import 'package:flutter/material.dart';
import 'package:samba_pos_app/core/constants/global_constants.dart';

class LocaleText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const LocaleText({Key key, @required this.text, this.textAlign = TextAlign.left}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: GlobalConstant.fontColorLive,
        fontSize: 14
      ),
    );
  }
}
