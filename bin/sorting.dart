import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dart_console/dart_console.dart';
import 'package:sorting/algo.dart';
import 'package:sorting/algotype.dart';

void main(List<String> arguments) {
  final console = Console();
  var debug = true;
  var setsList = [2500, 25000, 250000];
  var wertebereich = 10000;
  var algos = {
    AlgoType.countingSort: true,
    AlgoType.mergeSort: true,
    AlgoType.insertionSort: true,
    AlgoType.bubbleSort: true,
  };
  var allowed = ['1', '2', '3', '4', 'w*', 'x', 'y', 'z', 'q', 'r'];
  var sets = <int, bool>{};
  if (setsList.length != 3) {
    print('Es müssen genau 3 Testszenarien sein');
    exit(1002);
  }
  setsList.forEach((element) {
    sets[element] = true;
  });

  while (true) {
    var input = getInput(allowed, sets, algos, wertebereich, console);

    if (input == null) {
      exit(1001);
    } else if (input == '1') {
      algos[AlgoType.bubbleSort] = !algos[AlgoType.bubbleSort]!;
    } else if (input == '2') {
      algos[AlgoType.mergeSort] = !algos[AlgoType.mergeSort]!;
    } else if (input == '3') {
      algos[AlgoType.insertionSort] = !algos[AlgoType.insertionSort]!;
    } else if (input == '4') {
      algos[AlgoType.countingSort] = !algos[AlgoType.countingSort]!;
    } else if (input == 'x') {
      sets[setsList[0]] = !sets[setsList[0]]!;
    } else if (input == 'y') {
      sets[setsList[1]] = !sets[setsList[1]]!;
    } else if (input == 'z') {
      sets[setsList[2]] = !sets[setsList[2]]!;
    } else if (input == 'q') {
      print('Exit because the user wants so');
      exit(0);
    } else if (input == 'r') {
      runTests(sets, algos, wertebereich, console, debug);
      exit(0);
    } else if (input.startsWith('w')) {
      var argument = input.substring(1).trim();
      wertebereich = int.tryParse(argument) ?? wertebereich;
    } else {
      print('Error: Undefined command "$input"');
      exit(1001);
    }
  }
}

String? getInput(List<String> allowed, Map<int, bool> sets, Map<AlgoType, bool> algos, int wertebereich, Console console) {
  String? input;
  while (!allowed.contains(input) && !allowed.contains('${input?.substring(0, 1)}*')) {
    writeMenu(sets, algos, wertebereich, console);
    input = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
    print('received: "$input"');
  }
  return input;
}

void writeMenu(Map<int, bool> sets, Map<AlgoType, bool> algos, int wertebereich, Console console) {
  var setsList = <int>[];
  sets.forEach((key, value) {
    setsList.add(key);
  });
  console.clearScreen();
  console.resetCursorPosition();
  print('${algos[AlgoType.bubbleSort]! ? '**' : '  '} 1) Bubble Sort');
  print('${algos[AlgoType.mergeSort]! ? '**' : '  '} 2) Merge  Sort');
  print('${algos[AlgoType.insertionSort]! ? '**' : '  '} 3) Insertion  Sort');
  print('${algos[AlgoType.countingSort]! ? '**' : '  '} 3) Counting  Sort');
  print('?? w) Wertebereich festlegen: $wertebereich');
  print('${sets[setsList[0]]! ? '**' : '  '} x) ${setsList[0]} Werte');
  print('${sets[setsList[1]]! ? '**' : '  '} y) ${setsList[1]} Werte');
  print('${sets[setsList[2]]! ? '**' : '  '} z) ${setsList[2]} Werte');
  print('r) RUN TEST');
  print('q) Quit program');
}

void runTests(Map<int, bool> sets, Map<AlgoType, bool> algos, int wertebereich, Console console, bool debug) {
  // ignore: omit_local_variable_types
  var rng = Random();
  var unsortedLists = <int, List<int>>{};
  var setsList = <int>[];
  sets.forEach((key, value) {
    setsList.add(key);
  });

  if (sets[setsList[0]]!) {
    unsortedLists[setsList[0]] = List.generate(setsList[0], (index) => rng.nextInt(wertebereich));
  }
  if (sets[setsList[1]]!) {
    unsortedLists[setsList[1]] = List.generate(setsList[1], (index) => rng.nextInt(wertebereich));
  }
  if (sets[setsList[2]]!) {
    unsortedLists[setsList[2]] = List.generate(setsList[2], (index) => rng.nextInt(wertebereich));
  }
  algos.forEach((algoType, processAlgo) {
    if (processAlgo) {
      final algo = Algo.fromType(algoType);
      sets.forEach((number, processNumber) {
        if (processNumber) {
          final listCopy = <int>[];
          unsortedLists[number]!.forEach((element) {
            listCopy.add(element);
          });
          if (debug) {
            // print('Processing: $algoType: $listCopy');
          }
          algo.unsorted = listCopy;
          final timeBefore = DateTime.now();
          algo.run();
          final timeAfter = DateTime.now();
          if (debug) {
            // print('Processed: $algoType: ${algo.sorted}');
          }
          print('Processed: $algoType: $number: ${timeAfter.difference(timeBefore).inMilliseconds}');
        }
      });
    }
  });
}
