import 'package:flutter/material.dart';
import 'package:samba_pos_app/core/constants/global_constants.dart';

class OeCustomSpinner extends StatelessWidget {
  const OeCustomSpinner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(backgroundColor: GlobalConstant.mainSoft,valueColor: AlwaysStoppedAnimation<Color>(GlobalConstant.fontColorLive),));
  }
}
