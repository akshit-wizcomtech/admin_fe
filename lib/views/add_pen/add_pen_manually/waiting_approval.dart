import 'package:admin_fe/components/index.dart';
import 'package:admin_fe/layout/index.dart';
import 'package:flutter/material.dart';

class WaitingApproval extends StatefulWidget {
  const WaitingApproval({Key? key}) : super(key: key);

  @override
  State<WaitingApproval> createState() => _WaitingApprovalState();
}

class _WaitingApprovalState extends State<WaitingApproval> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      showAppBar: false,
      showBottomSheet: false,
      layoutChild: Container(
        padding: const EdgeInsets.only(top: 40),
        width: double.infinity,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WaitTimerCard(),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 60,
            ),
            WaitTimerCard(),
          ],
        ),
      ),
    );
  }
}
