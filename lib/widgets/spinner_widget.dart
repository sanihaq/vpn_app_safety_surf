import 'package:flutter/material.dart';
import '../utils/app_icons.dart';

class SpinnerWidget extends StatefulWidget {
  const SpinnerWidget({
    super.key,
  });

  @override
  State<SpinnerWidget> createState() => _SpinnerWidgetState();
}

class _SpinnerWidgetState extends State<SpinnerWidget> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  )..repeat(reverse: false);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Icon(
        AppIcons.spinner,
        size: 28,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
