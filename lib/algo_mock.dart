import 'package:sorting/algo.dart';

class AlgoMock extends Algo {
  AlgoMock();

  @override
  void run() {
    sorted = unsorted;
    return;
  }
}
