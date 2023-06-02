import 'package:admin_fe/provider/index.dart';
import 'package:admin_fe/utils/them.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatefulWidget {
  const DefaultLayout({
    Key? key,
    this.tabController,
    this.appBar,
    required this.layoutChild,
    this.bottomNavigationWidgets,
    this.showBottomSheet = true,
    this.showAppBar = true,
  }) : super(key: key);

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();

  final TabController? tabController;
  final List<Widget>? bottomNavigationWidgets;
  final Map<String, dynamic>? appBar;
  final Widget layoutChild;
  final bool showBottomSheet;
  final bool showAppBar;
}

const minDraggableScrollableSheetSize = 0.3;
const maxDraggableScrollableSheetSize = 1.0;

class _DefaultLayoutState extends State<DefaultLayout> {
  DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  bool isLogoutLoading = false;
  bool isBottomDraggableSheetOpen = false;

  void sheetToggle() {
    if (draggableScrollableController.size == minDraggableScrollableSheetSize) {
      setState(() {
        isBottomDraggableSheetOpen = false;
      });
    } else {
      setState(() {
        isBottomDraggableSheetOpen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authConsumer = useAuthProvider(context);
    return SafeArea(
        child: Scaffold(
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: ReplyColors.indigo_600,
              ),
              child: Center(
                  child: Text(
                'Drawer Header',
                style: TextStyle(color: ReplyColors.white),
              )),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                authConsumer.logout(context);
              },
            ),
          ],
        ),
      ),
      appBar: widget.showAppBar
          ? AppBar(
              toolbarHeight: widget.appBar?["toolbarHeight"] ?? 70,
              iconTheme: widget.appBar?["iconTheme"] ??
                  const IconThemeData(color: ReplyColors.white),
              elevation: widget.appBar?["elevation"] ?? 3,
              backgroundColor:
                  widget.appBar?["backgroundColor"] ?? const Color(0xff2f3775),
              title: widget.appBar?["title"] ??
                  const Text(
                    'Admin app',
                    style: TextStyle(color: ReplyColors.white),
                  ),
              actions: widget.appBar?["actions"],
              bottom: widget.appBar?["bottom"],
              centerTitle: false,
              titleSpacing: widget.appBar?["titleSpacing"],
            )
          : null,
      body: widget.showBottomSheet
          ? Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 52.8),
                  child: widget.layoutChild,
                ),
                if (isBottomDraggableSheetOpen)
                  GestureDetector(
                    child: Container(
                      color: Colors.transparent,
                    ),
                    onTap: () {
                      setState(() {
                        if (draggableScrollableController.isAttached) {
                          draggableScrollableController.reset();
                        }
                      });
                    },
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 150,
                    child: DraggableScrollableSheet(
                      controller: draggableScrollableController,
                      initialChildSize: minDraggableScrollableSheetSize,
                      minChildSize: minDraggableScrollableSheetSize,
                      maxChildSize: maxDraggableScrollableSheetSize,
                      snap: true,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        draggableScrollableController.addListener(sheetToggle);
                        return Container(
                          color: const Color(0xff2f3775),
                          child: ListView(
                            controller: scrollController,
                            children: [
                              Container(
                                color: Colors.white,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 108,
                                      height: 4,
                                      margin: const EdgeInsets.only(
                                          bottom: 32, top: 16),
                                      decoration: const BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.horizontal(
                                              left: Radius.circular(8),
                                              right: Radius.circular(8))),
                                    ),
                                  ],
                                ),
                              ),
                              if (widget.bottomNavigationWidgets != null)
                                CustomScrollView(
                                  primary: false,
                                  shrinkWrap: true,
                                  slivers: <Widget>[
                                    SliverPadding(
                                      padding: const EdgeInsets.all(20),
                                      sliver: SliverGrid.builder(
                                          itemCount: widget
                                              .bottomNavigationWidgets?.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return widget
                                                    .bottomNavigationWidgets?[
                                                index];
                                          }),
                                    ),
                                  ],
                                )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            )
          : widget.layoutChild,
    ));
  }
}
