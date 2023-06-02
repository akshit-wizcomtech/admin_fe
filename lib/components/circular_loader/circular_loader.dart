import 'package:flutter/material.dart';

class CircularLoader extends StatefulWidget {
  const CircularLoader({super.key, this.color, this.strokeWidth});

  @override
  State<CircularLoader> createState() => _CircularLoaderState();

  final Color? color;
  final double? strokeWidth;
}

class _CircularLoaderState extends State<CircularLoader>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: controller.value,
      color: widget.color,
      strokeWidth: widget.strokeWidth ?? 2,
    );
  }
}
