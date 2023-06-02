import 'package:admin_fe/utils/them.dart';
import 'package:flutter/material.dart';

class IconTab extends StatefulWidget {
  const IconTab(
      {Key? key,
      required this.tabs,
      required this.activeTabIndex,
      required this.changeActiveTabIndex})
      : super(key: key);

  final List<Map> tabs;
  final int activeTabIndex;
  final Function changeActiveTabIndex;

  @override
  State<IconTab> createState() => _IconTabState();
}

class _IconTabState extends State<IconTab> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ...widget.tabs.asMap().entries.map((tab) => GestureDetector(
            onTap: () {
              widget.changeActiveTabIndex(tab.key);
            },
            child: Column(children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(26, 14, 27, 12),
                  decoration: BoxDecoration(
                    color: ReplyColors.white400,
                    border: Border.all(
                        color: tab.key == widget.activeTabIndex
                            ? ReplyColors.indigo_600
                            : Colors.transparent,
                        width: tab.key == widget.activeTabIndex ? 2 : 0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    tab.value["icon"],
                    size: 30,
                    color: ReplyColors.orange,
                  )),
              Container(
                padding: const EdgeInsets.fromLTRB(17, 9, 17, 13),
                child: Text(
                  tab.value["title"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: ReplyColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ))
    ]);
  }
}
