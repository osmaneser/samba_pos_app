import 'package:flutter/cupertino.dart';

extension ContextExtension on BuildContext {
  double get height => this.size.height;
  double get width => this.size.width;
}
