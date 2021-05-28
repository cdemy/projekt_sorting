import 'package:sorting/algo.dart';

class AlgoInsertionSort extends Algo {
  AlgoInsertionSort();

  @override
  void run() {
    int temp;
    for (var i = 1; i < unsorted.length; i++) {
      temp = unsorted[i];
      var j = i;
      while (j > 0 && unsorted[j - 1] > temp) {
        unsorted[j] = unsorted[j - 1];
        j--;
      }
      unsorted[j] = temp;
    }
    sorted = unsorted;
    return;
  }
}
