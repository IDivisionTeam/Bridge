import 'package:flutter/material.dart';

class BridgeButton extends StatelessWidget {
  final VoidCallback? onClick;
  final Widget? child;
  final ButtonStyle? style;

  const BridgeButton({
    super.key,
    required this.onClick,
    this.style,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    // TODO(theme): config theming and dark/light mode support.
    return ElevatedButton(
      style: style,
      onPressed: onClick,
      child: child,
    );
  }
}
