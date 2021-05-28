import 'package:sorting/algo.dart';

class AlgoBubbleSort extends Algo {
  AlgoBubbleSort();

  @override
  void run() {
    int a;
    for (var k = 1; k < unsorted.length; k++) {
      for (var b = 0; b < (unsorted.length - k); b++) {
        if (unsorted[b] > unsorted[b + 1]) {
          a = unsorted[b];
          unsorted[b] = unsorted[b + 1];
          unsorted[b + 1] = a;
        }
      }
    }
    sorted = unsorted;
    return;
  }
}
