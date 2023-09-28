import 'dart:math' as math;

import 'package:core_designsystem/designsystem.dart';
import 'package:core_ui/ui.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
    this.onLoginNavClick,
    this.onSignUpNavClick,
  });

  final VoidCallback? onLoginNavClick;
  final VoidCallback? onSignUpNavClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Expanded(
            flex: 3,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(170 * math.pi / 180),
                  child: BridgeCard(
                    // FIXME(playing-card): randomize rank & suit.
                    rank: 'T',
                    suit: 'S',
                    ratio: 0.4,
                  ),
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(200 * math.pi / 180),
                  child: BridgeCard(
                    // FIXME(playing-card): randomize rank & suit.
                    rank: 'K',
                    suit: 'D',
                    ratio: 0.4,
                  ),
                ),
              ],
            ),
          ),
          BridgeButton(
            onClick: () => onSignUpNavClick?.call(),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(36),
            ),
            child: const Text('Sign up'),
          ),
          BridgeButton(
            onClick: () => onLoginNavClick?.call(),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(36),
            ),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
