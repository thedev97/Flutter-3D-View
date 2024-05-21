import 'package:flutter/foundation.dart';

class Page3DView extends ChangeNotifier{

  double value;

  Page3DView({required this.value});

  void setValue(newValue){
    value = newValue;
    notifyListeners();
  }
}