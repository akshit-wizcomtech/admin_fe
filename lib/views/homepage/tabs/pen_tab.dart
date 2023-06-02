import 'dart:math' as math;

import 'package:admin_fe/components/index.dart';
import 'package:admin_fe/controller_local/index.dart';
import 'package:admin_fe/utils/index.dart';
import 'package:admin_fe/utils/sharedPreferences.extension.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PenTab extends StatefulWidget {
  const PenTab({Key? key}) : super(key: key);

  @override
  State<PenTab> createState() => _PenTabState();
}

class _PenTabState extends State<PenTab> {
  List<Map> pens = [];

  void fetchPens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map userData = prefs.getObject(STORAGE_KEYS.USER_DATA);
    viewPenTab(organizationId: userData["organizationId"]).then((value) {
      setState(() {
        pens = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPens();
  }

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
                const Text("Pen Details"),
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
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: pens.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return PenCard(
                      status: pens[index]["currentStatus"],
                      type: pens[index]["type"],
                      serialNumber: pens[index]["serialNumber"]);
                }),
          ),
          // Expanded(
          //   child: ListView.builder(
          //       itemCount: 100,
          //       shrinkWrap: true,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Text("$index");
          //       }),
          // )
        ],
      ),
    );
  }
}
