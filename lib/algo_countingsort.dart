import 'package:sorting/algo.dart';

class AlgoCountingSort extends Algo {
  AlgoCountingSort();

  @override
  void run() {
    var maximum = unsorted[0];
    for (var i = 1; i < unsorted.length; i++) {
      if (unsorted[i] > maximum) {
        maximum = unsorted[i];
      }
    }
    var hilfsarray = List.generate(maximum + 1, (index) => 0);
    for (var i = 0; i < unsorted.length; i++) {
      hilfsarray[unsorted[i]]++;
    }
    var position = 0;
    for (var i = 0; i <= maximum; i++) {
      for (var j = 0; j < hilfsarray[i]; j++) {
        unsorted[position] = i;
        position++;
      }
    }
    sorted = unsorted;
    return;
  }
}
