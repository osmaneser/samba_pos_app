import 'package:flutter/material.dart';

class OeThumbnailImage extends StatelessWidget {
  final String path;
  const OeThumbnailImage({Key key, @required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Image.asset(
        path,
        fit: BoxFit.cover,
      ),
    );
  }
}
