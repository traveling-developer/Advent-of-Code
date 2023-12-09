import 'package:adventofcode2023/day.dart';
import 'package:adventofcode2023/helper/string_extensions.dart';
import 'package:collection/collection.dart';

class Day7 implements Day {
  @override
  int get dayNumber => 7;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    var hands = puzzleInput.splitPerLine().map((e) => Hand(e)).toList();
    hands.sort((a, b) => a.compareTo(b));

    var totalWinnings = 0;

    for (var i = 0; i < hands.length; i++) {
      totalWinnings = totalWinnings + hands[i].bid * (i + 1);
    }

    return totalWinnings.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    _cardStrength['J'] = 0;

    var hands = puzzleInput.splitPerLine().map((e) => Hand.withJoker(e)).toList();
    hands.sort((a, b) => a.compareTo(b));

    var totalWinnings = 0;
    for (var i = 0; i < hands.length; i++) {
      totalWinnings = totalWinnings + hands[i].bid * (i + 1);
    }

    return totalWinnings.toString();
  }
}

enum HandType { highCard, onePair, twoPairs, threeOfAKind, fullHouse, fourOfAKind, fiveOfAKind }

class Hand {
  late String _hand;

  int bid = 0;
  HandType type = HandType.highCard;

  Hand(String rawHand) {
    var parts = rawHand.split(' ');
    bid = int.parse(parts.last);
    _hand = parts.first;

    _initializeType();
  }

  factory Hand.withJoker(String rawHand) {
    var hand = Hand(rawHand);

    hand._initializeTypeWithJoker();

    return hand;
  }

  int compareTo(Hand other) {
    if (type.index == other.type.index) {
      return _compareToCardsStrength(other);
    }

    return type.index.compareTo(other.type.index);
  }

  int _compareToCardsStrength(Hand other) {
    for (var cards in IterableZip([_hand.split(''), other._hand.split('')])) {
      if (cards.first != cards.last) {
        var strength = _cardStrength[cards.first]!;
        var otherStrength = _cardStrength[cards.last]!;

        return strength.compareTo(otherStrength);
      }
    }
    return 0;
  }

  void _initializeType() {
    Map<String, int> cardToOccurrence = _getCardToOccurrenceMap();

    if (cardToOccurrence.length == 1) {
      type = HandType.fiveOfAKind;
    } else if (cardToOccurrence.length == 2 && cardToOccurrence.containsValue(4)) {
      type = HandType.fourOfAKind;
    } else if (cardToOccurrence.length == 2 &&
        cardToOccurrence.containsValue(3) &&
        cardToOccurrence.containsValue(2)) {
      type = HandType.fullHouse;
    } else if (cardToOccurrence.length == 3 && cardToOccurrence.containsValue(3)) {
      type = HandType.threeOfAKind;
    } else if (cardToOccurrence.length == 3 &&
        cardToOccurrence.values.where((element) => element == 2).length == 2) {
      type = HandType.twoPairs;
    } else if (cardToOccurrence.length == 4) {
      type = HandType.onePair;
    } else if (cardToOccurrence.length == 5) {
      type = HandType.highCard;
    }
  }

  void _initializeTypeWithJoker() {
    Map<String, int> cardToOccurrence = _getCardToOccurrenceMap();
    var handContainsJoker = cardToOccurrence.keys.contains('J');

    if (cardToOccurrence.length == 1) {
      type = HandType.fiveOfAKind;
    } else if (cardToOccurrence.length == 2 && cardToOccurrence.containsValue(4)) {
      type = HandType.fourOfAKind;

      if (handContainsJoker) {
        type = HandType.fiveOfAKind;
      }
    } else if (cardToOccurrence.length == 2 &&
        cardToOccurrence.containsValue(3) &&
        cardToOccurrence.containsValue(2)) {
      type = HandType.fullHouse;

      if (handContainsJoker) {
        type = HandType.fiveOfAKind;
      }
    } else if (cardToOccurrence.length == 3 && cardToOccurrence.containsValue(3)) {
      type = HandType.threeOfAKind;

      if (handContainsJoker && cardToOccurrence['J'] == 1) {
        type = HandType.fourOfAKind;
      } else if (handContainsJoker && cardToOccurrence['J'] == 3) {
        type = HandType.fourOfAKind;
      }
    } else if (cardToOccurrence.length == 3 &&
        cardToOccurrence.values.where((element) => element == 2).length == 2) {
      type = HandType.twoPairs;

      if (handContainsJoker && cardToOccurrence['J'] == 1) {
        type = HandType.fullHouse;
      }
      if (handContainsJoker && cardToOccurrence['J'] == 2) {
        type = HandType.fourOfAKind;
      }
    } else if (cardToOccurrence.length == 4) {
      type = HandType.onePair;

      if (handContainsJoker) {
        type = HandType.threeOfAKind;
      }
    } else if (cardToOccurrence.length == 5) {
      type = HandType.highCard;

      if (handContainsJoker) {
        type = HandType.onePair;
      }
    }
  }

  Map<String, int> _getCardToOccurrenceMap() {
    Map<String, int> cardToOccurrence = {};

    for (var element in _hand.split('')) {
      if (cardToOccurrence.containsKey(element)) {
        cardToOccurrence[element] = cardToOccurrence[element]! + 1;
      } else {
        cardToOccurrence.putIfAbsent(element, () => 1);
      }
    }

    return cardToOccurrence;
  }
}

final Map<String, int> _cardStrength = {
  'A': 13,
  'K': 12,
  'Q': 11,
  'J': 10,
  'T': 9,
  '9': 8,
  '8': 7,
  '7': 6,
  '6': 5,
  '5': 4,
  '4': 3,
  '3': 2,
  '2': 1,
};
