import 'package:admin_fe/utils/index.dart';
import 'package:flutter/material.dart';

class TimerCircular extends StatefulWidget {
  const TimerCircular(
      {super.key,
      this.color,
      this.strokeWidth,
      required this.durationSeconds,
      this.backgroundColor});

  @override
  State<TimerCircular> createState() => _TimerCircularState();

  final Color? color;
  final Color? backgroundColor;
  final double? strokeWidth;
  final int durationSeconds;
}

class _TimerCircularState extends State<TimerCircular>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.durationSeconds),
    )..addListener(() {
        setState(() {});
      });
    controller.reverse(from: 1);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(150))),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          if ((controller.value * widget.durationSeconds).toInt() > 0) ...{
            CircularProgressIndicator(
              value: controller.value,
              color: widget.color,
              strokeWidth: widget.strokeWidth ?? 2,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                formatDuration_mmSS(Duration(
                    seconds:
                        (controller.value * widget.durationSeconds).toInt())),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          },
          if ((controller.value * widget.durationSeconds).toInt() == 0)
            const FittedBox(
              child: Icon(
                Icons.task_alt_outlined,
                color: Colors.green,
              ),
            )
        ],
      ),
    );
  }
}
