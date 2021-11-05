import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final double offset;
  final Axis axis;
  final double opacity;
  const ShakeTransition({
    Key? key,
    @required this.child,
    this.duration = const Duration(milliseconds: 900),
    this.offset = 80,
    this.axis = Axis.vertical,
    this.opacity = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: child,
      tween: Tween(begin: 0.2, end: 1.0),
      duration: duration,
      curve: Curves.easeInOut,
      builder: (context, double values, child1) {
        return Transform.translate(
            offset: axis == Axis.horizontal
                ? Offset(values * offset / 5, 0.0)
                : Offset(0.0, (1 - values) * offset),
            child: AnimatedOpacity(
              opacity: values * opacity,
              duration: duration,
              child: child1,
            ));
      },
    );
  }
}
