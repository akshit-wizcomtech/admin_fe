import 'dart:math' as math;

import 'package:flutter/material.dart';

class AdminTab extends StatefulWidget {
  const AdminTab({Key? key}) : super(key: key);

  @override
  State<AdminTab> createState() => _AdminTabState();
}

class _AdminTabState extends State<AdminTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Admin Details"),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  color: Colors.grey,
                  height: 1,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.filter_alt_sharp,
                        color: Colors.grey,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          Transform.rotate(
                              angle: 90 * math.pi / 180,
                              child: const Icon(
                                Icons.keyboard_control,
                                color: Colors.grey,
                              )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
