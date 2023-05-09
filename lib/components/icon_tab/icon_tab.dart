import 'package:flutter/material.dart';

class IconTab extends StatefulWidget {
  const IconTab({Key? key, required this.tabs, required this.activeTabIndex, required this.changeActiveTabIndex}) : super(key: key);

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
                      color: Colors.grey,
                      border: Border.all(color: Colors.indigo, width: tab.key == widget.activeTabIndex ? 2 : 0),
                      borderRadius: BorderRadius.circular(7),

                  ),
                  child: Icon(
                    tab.value["icon"],
                    size: 30,
                    color: Colors.orange,
                  )),
              Container(
                padding: const EdgeInsets.fromLTRB(17, 9, 17, 13),
                child: Text(
                  tab.value["title"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              )
            ]),
      ))
    ]);
  }
}
