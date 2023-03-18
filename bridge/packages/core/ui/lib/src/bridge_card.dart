import 'dart:ui' as ui;

import 'package:core_model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BridgeCard extends StatelessWidget {
  const BridgeCard({
    super.key,
    required this.rank,
    required this.suit,
    this.ratio = 0.6,
  });

  final String rank;
  final String suit;
  final double ratio;
  final Size _cardSize = const Size(448, 608);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadImage('graphics/deck.png'),
      builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
        final playingCard = PlayingCard(
          rank: rank,
          suit: suit,
          width: _cardSize.width,
          height: _cardSize.height,
        );

        if (snapshot.hasData) {
          return CustomPaint(
            painter: PlayingCardPainter(
              snapshot.data!,
              playingCard,
              _cardSize,
              ratio,
            ),
          );
        }

        if (snapshot.hasError) {
          return const Text('Something went wrong.');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  Future<ui.Image> _loadImage(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    return decodeImageFromList(bytes);
  }
}

class PlayingCardPainter extends CustomPainter {
  PlayingCardPainter(this.spriteAtlas, this.card, this.cardSize, this.ratio);

  final ui.Image spriteAtlas;
  final Size cardSize;
  final double ratio;
  final PlayingCard card;

  @override
  void paint(Canvas canvas, Size size) {
    canvas
      ..save()
      ..scale(ratio, ratio)
      ..translate(-card.sprite.left, -card.sprite.top)
      ..clipRect(Rect.fromLTWH(
          card.sprite.left, card.sprite.top, cardSize.width, cardSize.height))
      ..drawImage(spriteAtlas, Offset.zero, Paint())
      ..restore();
  }

  @override
  bool shouldRepaint(covariant PlayingCardPainter oldDelegate) =>
      card != oldDelegate.card;
}
