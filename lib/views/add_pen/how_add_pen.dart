import 'package:admin_fe/components/index.dart';
import 'package:admin_fe/layout/index.dart';
import 'package:admin_fe/routes/index.dart';
import 'package:admin_fe/utils/them.dart';
import 'package:flutter/material.dart';

class HowAddPen extends StatefulWidget {
  const HowAddPen({Key? key}) : super(key: key);

  @override
  State<HowAddPen> createState() => _HowAddPenState();
}

class _HowAddPenState extends State<HowAddPen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: const {
        "title": Text(
          'Add Pen',
          style: TextStyle(color: ReplyColors.white),
        )
      },
      layoutChild: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              text: "Add Pen Manually",
              border: Border.all(width: 0),
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.pushNamed(context, Routes.registerPenManually);
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: const Text(
                "Or",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      showBottomSheet: false,
    );
  }
}
