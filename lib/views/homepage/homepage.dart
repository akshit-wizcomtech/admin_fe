import 'package:admin_fe/components/index.dart';
import 'package:admin_fe/layout/index.dart';
import 'package:admin_fe/routes/index.dart';
import 'package:admin_fe/views/index.dart';
import 'package:flutter/material.dart';

const minDraggableScrollableSheetSize = 0.44;
const maxDraggableScrollableSheetSize = 1.0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController? tabController =
      TabController(length: 3, vsync: this);

  List<List<Widget> Function(BuildContext context)> bottomNavigationItems = [
    (BuildContext context) {
      return <Widget>[
        const BottomSheetButton(
          text: "Delete",
          icon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        const BottomSheetButton(
          text: "Delete",
          icon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        const BottomSheetButton(
          text: "Delete",
          icon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        const BottomSheetButton(
          text: "Delete",
          icon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        BottomSheetButton(
          text: "Add Pen",
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pushNamed(context, Routes.howAddPen);
          },
        ),
        const BottomSheetButton(
          text: "Delete",
          icon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        )
      ];
    }
  ];

  late List<Widget> bottomNavigationWidgets = bottomNavigationItems[0](context);

  @override
  Widget build(BuildContext context) {
    // final authConsumer = useAuthProvider(context);
    return DefaultLayout(
      tabController: tabController,
      bottomNavigationWidgets: bottomNavigationWidgets,
      appBar: {
        "titleSpacing": 56.0,
        "bottom": TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.edit),
              text: "Pen",
            ),
            Tab(icon: Icon(Icons.person), text: "Student"),
            Tab(icon: Icon(Icons.person_sharp), text: "Admin"),
          ],
          onTap: (int index) {
            setState(() {
              bottomNavigationWidgets = bottomNavigationItems[index](context);
            });
          },
        )
      },
      layoutChild: TabBarView(
        controller: tabController,
        children: const <Widget>[
          PenTab(),
          StudentTab(),
          AdminTab(),
        ],
      ),
    );
  }
}
