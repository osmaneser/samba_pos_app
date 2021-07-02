import 'package:flutter/material.dart';
import 'package:samba_pos_app/core/constants/global_constants.dart';

class OeCustomCard extends StatelessWidget {
  final Widget child;
  const OeCustomCard({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: GlobalConstant.mainSoft,
      elevation: 2,
      child: child,
    );
  }
}
