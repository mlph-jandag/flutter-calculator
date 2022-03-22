import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CalculatorChangeNotifier extends ChangeNotifier {
  int _count = 0;
  String equation = "";
  String result = "";

  Future<void> increment() async {
    _count += 1;
    notifyListeners();
  }

  Future<void> onType(String clicked) async {
    print('you clicked $clicked');
  }

  int get count {
    return _count;
  }
}

T useChangeNotifierListenable<T extends ChangeNotifier>(T data) {
  final state = useState<T>(data);
  return useListenable(state.value);
}
