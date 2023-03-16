import 'dart:ui' as ui;

import 'package:core_model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BridgeCard extends StatelessWidget {
  const BridgeCard({
    super.key,
    required this.rank,
    required this.suit,
    required this.size,
  });

  final String rank;
  final String suit;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadImage('graphics/deck.png'),
      builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
        final playingCard = PlayingCard(
          rank: rank,
          suit: suit,
          width: size.width,
          height: size.height,
        );

        if (snapshot.hasData) {
          return CustomPaint(
            painter: PlayingCardPainter(
              snapshot.data!,
              playingCard,
              size.width,
              size.height,
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
  PlayingCardPainter(this.spriteAtlas, this.card, this.width, this.height);

  ui.Image spriteAtlas;
  double width;
  double height;
  PlayingCard card;

  @override
  void paint(Canvas canvas, Size size) {
    canvas
      ..save()
      ..scale(0.4, 0.4) // FIXME(onboarding): calculate using phone width divided by the card width.
      ..translate(-card.sprite.left, -card.sprite.top)
      ..clipRect(Rect.fromLTWH(card.sprite.left, card.sprite.top, width, height))
      ..drawImage(spriteAtlas, Offset.zero, Paint())
      ..restore();
  }

  @override
  bool shouldRepaint(covariant PlayingCardPainter oldDelegate) => card != oldDelegate.card;
}
