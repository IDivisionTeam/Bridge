import 'package:core_model/src/rank.dart';
import 'package:core_model/src/sprite.dart';
import 'package:core_model/src/suit.dart';

class PlayingCard {
  PlayingCard({
    required String rank,
    required String suit,
    required double width,
    required double height,
    double rotation = 0,
  }) {
    final x = width * ranks.indexOf(rank);
    final y = height * suits.indexOf(suit);
    sprite = Sprite(rotation, left: x, top: y);
  }

  Sprite sprite = Sprite.empty();
}
