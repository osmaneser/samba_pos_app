import 'package:flutter/material.dart';
import 'package:samba_pos_app/core/extensions/context_extension.dart';

class OeContentImage extends StatelessWidget {
  final String path;
  const OeContentImage({Key key, @required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Flexible(
      child: Image.asset(
        path,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.cover,
      ),
    );
  }
}
