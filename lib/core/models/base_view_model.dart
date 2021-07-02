import 'package:flutter/cupertino.dart';

enum BaseState { Initial, Busy, Done, Error }

class BaseViewModel with ChangeNotifier {
  BaseState _state = BaseState.Initial;

  String message = "";

  get state => _state;

  set state(BaseState value) {
    _state = value;
    notifyListeners();
  }
}
