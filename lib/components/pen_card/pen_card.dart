import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PenCard extends StatefulWidget {
  const PenCard(
      {Key? key,
      required this.status,
      required this.type,
      required this.serialNumber})
      : super(key: key);

  @override
  State<PenCard> createState() => _PenCardState();

  final String status;
  final String type;
  final String serialNumber;
}

class _PenCardState extends State<PenCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          margin: const EdgeInsets.only(right: 16, left: 16, top: 16),
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color(0xff404A6F),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Archive",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        secondaryBackground: Container(
          margin: const EdgeInsets.only(right: 16, left: 16, top: 16),
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color(0xff404A6F),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Delete",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.endToStart) {
            final bool res = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const Text("Are you sure you want to delete?"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      TextButton(
                        child: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                    ],
                  );
                });
            return res;
          }
          if (direction == DismissDirection.startToEnd) {
            final bool res = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const Text("Are you sure you want to archive?"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      TextButton(
                        child: const Text(
                          "Archive",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                    ],
                  );
                });
            return res;
          }
          return false;
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(right: 16, left: 16, top: 16),
          decoration: const BoxDecoration(
            color: Color(0xFFF2F4F7),
            boxShadow: [
              BoxShadow(
                  color: Color(0xffE6DFDF), blurRadius: 5, offset: Offset(0, 5))
            ],
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          border: Border.all(color: Colors.black54, width: 1))),
                  const Icon(
                    Icons.battery_3_bar_outlined,
                    color: Colors.green,
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/male.svg"),
                      Container(
                        height: 6,
                        width: 48,
                        decoration: BoxDecoration(
                            color: widget.status == "Off"
                                ? Colors.red
                                : Colors.green,
                            border: Border.all(
                                color: const Color(0xff707070), width: 1)),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.serialNumber,
                          style: const TextStyle(
                              color: Color(0xffE31B2D),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Department Humanities",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          widget.type,
                          style: const TextStyle(
                              color: Color(0xff000000),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Status: ${widget.status == "Off" ? "Offline" : "Online"}",
                          style: const TextStyle(
                              color: Color(0xff000000),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Transform.rotate(
                      angle: 270 * pi / 180,
                      child: const Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.grey,
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
