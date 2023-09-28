class Sprite {
  Sprite(this.rotation, {required this.left, required this.top});

  Sprite.empty()
      : rotation = 0,
        left = 0,
        top = 0;

  final double left;
  final double top;
  final double rotation;
}
