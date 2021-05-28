import 'package:sorting/algo_bubblesort.dart';
import 'package:sorting/algo_countingsort.dart';
import 'package:sorting/algo_insertionsort.dart';
import 'package:sorting/algo_mergesort.dart';
import 'package:sorting/algo_mock.dart';
import 'package:sorting/algotype.dart';

abstract class Algo {
  List<int> unsorted = [];
  List<int> sorted = [];

  Algo();

  factory Algo.fromType(AlgoType type) {
    if (type == AlgoType.bubbleSort) {
      return AlgoBubbleSort();
    } else if (type == AlgoType.mergeSort) {
      return AlgoMergeSort();
    } else if (type == AlgoType.insertionSort) {
      return AlgoInsertionSort();
    } else if (type == AlgoType.countingSort) {
      return AlgoCountingSort();
    } else {
      return AlgoMock();
    }
  }

  void run();
}
