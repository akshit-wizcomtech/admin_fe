import 'package:admin_fe/utils/them.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatefulWidget {
  const LoginHeader({Key? key, required this.title, this.arrowLeftCallback})
      : super(key: key);

  final String title;
  final Function? arrowLeftCallback;

  @override
  State<LoginHeader> createState() => _LoginHeaderState();
}

class _LoginHeaderState extends State<LoginHeader> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              if (widget.arrowLeftCallback == null) {
                Navigator.pop(context);
              } else {
                widget.arrowLeftCallback!();
              }
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(17, 0, 19, 0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/arrow_left.png"),
                  fit: BoxFit.contain,
                ),
              ),
              child: const SizedBox(
                width: 24,
                height: 44,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(17, 9, 17, 13),
              decoration: const BoxDecoration(color: ReplyColors.indigo_700),
              child: Text(
                widget.title,
                style: const TextStyle(color: ReplyColors.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
