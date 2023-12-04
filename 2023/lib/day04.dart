import 'package:adventofcode2023/day.dart';
import 'package:adventofcode2023/helper/string_extensions.dart';
import 'package:collection/collection.dart';

class Day4 implements Day {
  @override
  int get dayNumber => 4;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    var cards = puzzleInput.splitPerLine().map((e) => Card(e)).toList();

    var result = cards.map((e) => e.getPoints()).sum;

    return result.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    var cards = puzzleInput.splitPerLine().map((e) => Card(e)).toList();

    var processedCards = processCards(cards);

    var result = processedCards.values.sum;

    return result.toString();
  }

  Map<Card, int> processCards(List<Card> cards) {
    var cardCopies = {for (var card in cards) card: 1};

    for (var card in cards) {
      var numberOfMatches = card.getNumberOfMatches();

      var numberOfCopies =
          cardCopies.entries.singleWhere((element) => element.key.id == card.id).value;

      for (var i = 1; i <= numberOfMatches; i++) {
        var cardCopy = cardCopies.entries.singleWhere((element) => element.key.id == card.id + i);
        cardCopies.update(cardCopy.key, (value) => value = value + (1 * numberOfCopies));
      }
    }

    return cardCopies;
  }
}

class Card {
  int id = 0;
  List<int> _winningNumbers = [];
  List<int> _personalNumbers = [];

  Card(String rawCard) {
    var idAndNumbers = rawCard.split(':');
    id = int.parse(idAndNumbers.first.split(' ').last);

    var numbers = idAndNumbers.last.split('|');
    _winningNumbers = numbers.first
        .split(' ')
        .where((element) => element.isNotEmpty)
        .map((e) => int.parse(e))
        .toList();
    _personalNumbers = numbers.last
        .split(' ')
        .where((element) => element.isNotEmpty)
        .map((e) => int.parse(e))
        .toList();
  }

  int getNumberOfMatches() {
    var matches = 0;

    for (var number in _personalNumbers) {
      if (_winningNumbers.contains(number)) {
        matches++;
      }
    }

    return matches;
  }

  int getPoints() {
    var points = 0;

    for (var number in _personalNumbers) {
      if (_winningNumbers.contains(number)) {
        if (points == 0) {
          points = 1;
        } else {
          points = points * 2;
        }
      }
    }

    return points;
  }
}
