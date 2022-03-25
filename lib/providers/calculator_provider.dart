import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorChangeNotifier extends ChangeNotifier {
  String equation = "0";
  String result = "0";

  double equationFontSize = 32;
  double resultFontSize = 46;

  Future<void> onType(String btnLabel) async {
    if (btnLabel == 'AC') {
      equation = "0";
      result = "0";
      resetDisplaySize();
    } else if (btnLabel == "DEL") {
      equation = equation.substring(0, equation.length - 1);
      if (equation == "") {
        equation = "0";
      }
      resetDisplaySize();
    } else if (btnLabel == "+/-") {
      try {
        equation = (double.parse(equation) * -1).toString();
      } catch (e) {
        equation = "-(" + equation + ")";
      }
      resetDisplaySize();
    } else if (btnLabel == '=') {
      equationFontSize = 32;
      resultFontSize = 38;

      String expression = equation;
      expression = expression.replaceAll(RegExp(r'x'), '*');

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        result = prettify(eval);
      } catch (e) {
        result = "Syntax Error";
      }
    } else {
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
