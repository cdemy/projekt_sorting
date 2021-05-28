import 'package:sorting/algo.dart';

class AlgoMergeSort extends Algo {
  AlgoMergeSort();

  @override
  void run() {
    sorted = _merge_sort(unsorted);
  }

  List<int> _merge_sort(List<int> a) {
    if (a.length > 1) {
      var mitte = a.length ~/ 2;
      var l = <int>[];
      for (var i = 0; i <= mitte - 1; i++) {
        l.add(a[i]);
      }
      var r = <int>[];
      for (var i = mitte; i <= a.length - 1; i++) {
        r.add(a[i]);
      }
      l = _merge_sort(l);
      r = _merge_sort(r);
      return _verschmelze(l, r);
    } else {
      return a;
    }
  }

  List<int> _verschmelze(List<int> l, List<int> r) {
    var neul = <int>[];
    var indexl = 0;
    var indexr = 0;
    while (indexl < l.length && indexr < r.length) {
      if (l[indexl] < r[indexr]) {
        neul.add(l[indexl]);
        indexl += 1;
      } else {
        neul.add(r[indexr]);
        indexr += 1;
      }
    }
    while (indexl < l.length) {
      neul.add(l[indexl]);
      indexl += 1;
    }
    while (indexr < r.length) {
      neul.add(r[indexr]);
      indexr += 1;
    }
    return neul;
  }
  // List<int> _verschmelze(List<int> l, List<int> r) {
  //   var neul = <int>[];
  //   var indexl = 0;
  //   var indexr = 0;
  //   var indexergebnis = 0;
  //   while (indexl < l.length && indexr < r.length) {
  //     if (l[indexl] < r[indexr]) {
  //       neul[indexergebnis] = l[indexl];
  //       indexl += 1;
  //     } else {
  //       neul[indexergebnis] = r[indexr];
  //       indexr += 1;
  //     }
  //     indexergebnis += 1;
  //   }
  //   while (indexl < l.length) {
  //     neul[indexergebnis] = l[indexl];
  //     indexl += 1;
  //     indexergebnis += 1;
  //   }
  //   while (indexr < r.length) {
  //     neul[indexergebnis] = r[indexr];
  //     indexr += 1;
  //     indexergebnis += 1;
  //   }
  //   return neul;
  // }
}
