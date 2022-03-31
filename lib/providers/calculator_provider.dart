import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorChangeNotifier extends ChangeNotifier {
  String equation = "0";
  String result = "0";

  List<String> inputs = [];

  double equationFontSize = 32;
  double resultFontSize = 46;
  bool clearEq = false;
  bool ans = false;
  String operation = "";

  static const List<String> operations = ["+", "-", "x", "/"];

  Future<void> onType(String btnLabel) async {
    if (btnLabel == 'AC') {
      equation = "0";
      result = "0";

      inputs.clear();
      clearEq = false;
      ans = false;

      resetDisplaySize();
    } else if (btnLabel == "DEL") {
      equation = equation.substring(0, equation.length - 1);
      if (equation == "") {
        equation = "0";
      }
      resetDisplaySize();
    } else if (btnLabel == "+/-") {
      equation = (double.parse(equation) * -1).toString();

      resetDisplaySize();
    } else if (btnLabel == "%") {
      equation = (double.parse(equation) * 0.01).toString();

      resetDisplaySize();
    } else if (btnLabel == '=') {
      equationFontSize = 32;
      resultFontSize = 38;

      if (!ans) inputs.add(equation);

      String expression = inputs.join("");
      expression = expression.replaceAll(RegExp(r'x'), '*');

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        result = prettify(eval);
        inputs = [result];
        clearEq = false;
        ans = true;
      } catch (e) {
        result = "Syntax Error";
      }
    } else if (operations.contains(btnLabel)) {
      operation = btnLabel;
      if (!clearEq) {
        clearEq = true;
      }
    } else {
      if (clearEq) {
        if (!ans) {
          inputs.add(equation);
        } else {
          ans = false;
        }
        inputs.add(operation);
        equation = "0";
        clearEq = false;
      }
      resetDisplaySize();
      if (equation.length != 13) {
        if (equation == "0") {
          equation = btnLabel;
        } else {
          equation = equation + btnLabel;
        }
      }
    }
    notifyListeners();
  }

  void resetDisplaySize() {
    equationFontSize = 46;
    resultFontSize = 32;
  }

  String prettify(double d) =>
      d.toStringAsFixed(3).replaceFirst(RegExp(r'\.?0*$'), '');
}
