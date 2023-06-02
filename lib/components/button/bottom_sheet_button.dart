import 'package:flutter/material.dart';

class BottomSheetButton extends StatefulWidget {
  const BottomSheetButton(
      {Key? key,
      required this.text,
      this.onTap,
      this.disabled = false,
      this.isLoading = false,
      required this.icon})
      : super(key: key);

  final String text;
  final Widget icon;
  final Function? onTap;
  final bool disabled;
  final bool isLoading;

  @override
  State<BottomSheetButton> createState() => _BottomSheetButtonState();
}

class _BottomSheetButtonState extends State<BottomSheetButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        (widget.onTap ?? () {})();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: const BoxDecoration(
              color: Color(0xff2f3775),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [BoxShadow(blurRadius: 6, offset: Offset(0, 3))],
            ),
            child: widget.icon,
          ),
          Text(
            widget.text,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
