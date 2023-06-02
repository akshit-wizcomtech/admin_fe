import 'dart:math' as math;

import 'package:admin_fe/components/index.dart';
import 'package:admin_fe/layout/index.dart';
import 'package:flutter/material.dart';

class CreateAccountLayout extends StatefulWidget {
  const CreateAccountLayout({
    Key? key,
    required this.loginHeader,
    required this.tabs,
    required this.tabWidgets,
    required this.onPrevious,
    this.onNext,
    required this.activeTabIndex,
    required this.changeActiveTabIndex,
    this.loginHeaderArrowCallback,
  }) : super(key: key);

  final Map<String, dynamic> loginHeader;
  final Function? loginHeaderArrowCallback;
  final List<Map> tabs;
  final List<Widget> tabWidgets;
  final Function onPrevious;
  final Function? onNext;
  final int activeTabIndex;
  final Function changeActiveTabIndex;

  @override
  State<CreateAccountLayout> createState() => _CreateAccountLayoutState();
}

class _CreateAccountLayoutState extends State<CreateAccountLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 26, 0, 0),
              child: LoginHeader(
                title: widget.loginHeader["title"] ?? "",
                arrowLeftCallback: widget.loginHeaderArrowCallback,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 26, 0, 0),
              child: IconTab(
                tabs: widget.tabs,
                activeTabIndex: widget.activeTabIndex,
                changeActiveTabIndex: widget.changeActiveTabIndex,
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16),
              child: IndexedStack(
                index: widget.activeTabIndex,
                children: widget.tabWidgets,
              ),
            )),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TODO: no rotations
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset(
                          "assets/images/back.png",
                          scale: 1.5,
                        ),
                        color: Colors.black,
                        splashColor: Colors.white,
                        onPressed: () {},
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 12),
                      //   child: Button(
                      //     text: 'Previous',
                      //     onTap: widget.onPrevious,
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          widget.onPrevious();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 12),
                          child: const Text(
                            "Previous",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),

                  widget.onNext == null
                      ? const SizedBox(
                          width: 1,
                        )
                      : Row(
                          children: [
                            Button(
                              text: 'Next',
                              onTap: widget.onNext,
                            ),
                            // TODO: no rotations
                            Transform.rotate(
                              angle: 180 * math.pi / 180,
                              child: IconButton(
                                icon: Image.asset(
                                  "assets/images/back.png",
                                  scale: 1.5,
                                ),
                                color: Colors.black,
                                splashColor: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
