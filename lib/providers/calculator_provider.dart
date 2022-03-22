import 'package:flutter/cupertino.dart';

class CalculatorChangeNotifier extends ChangeNotifier {
  String equation = "";
  String result = "";

  Future<void> onType(String clicked) async {
    print('you clicked $clicked');
    equation = equation + clicked;

    notifyListeners();
  }
}
