import 'package:admin_fe/components/index.dart';
import 'package:flutter/material.dart';

import '../../utils/them.dart';

class Button extends StatefulWidget {
  const Button(
      {Key? key,
      required this.text,
      this.onTap,
      this.disabled = false,
      this.isLoading = false,
      this.borderRadius,
      this.border})
      : super(key: key);

  final String text;
  final Function? onTap;
  final bool disabled;
  final bool isLoading;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (widget.onTap != null) {
        (widget.onTap ?? () {})();
        // }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [ReplyColors.indigo_400, ReplyColors.indigo_900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: widget.border ?? Border.all(color: ReplyColors.white),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(widget.disabled ? 0.5 : 0),
            // border: Border.all(color: Colors.white),
            // borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Visibility(
                visible: !widget.isLoading,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: widget.isLoading,
                child: const SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularLoader(
                    color: ReplyColors.indigo_900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
