import 'package:admin_fe/components/index.dart';
import 'package:admin_fe/utils/them.dart';
import 'package:flutter/material.dart';

class WaitTimerCard extends StatefulWidget {
  const WaitTimerCard({Key? key}) : super(key: key);

  @override
  State<WaitTimerCard> createState() => _WaitTimerCardState();
}

class _WaitTimerCardState extends State<WaitTimerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 28, bottom: 144, left: 16, right: 16),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 6,
                    color: ReplyColors.black45,
                    offset: Offset(
                      0,
                      3,
                    ),
                  ),
                ],
                color: const Color(0xffF2F2F2),
                border: Border.all(color: Colors.white)),
            child: const Text(
              "Sending Authentication Request To Pen",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff404A6F)),
            ),
          ),
          Positioned(
              bottom: -60,
              child: Container(
                  // color: Colors.white,
                  width: 120,
                  height: 120,
                  child: TimerCircular(
                    durationSeconds: 60,
                    strokeWidth: 30,
                    color: Colors.red,
                  )))
        ],
      ),
    );
  }
}
