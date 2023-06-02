import 'package:admin_fe/provider/auth_provider.dart';
import 'package:admin_fe/routes/index.dart';
import 'package:flutter/material.dart';

import '../utils/them.dart';

class UnderDevelopment extends StatefulWidget {
  const UnderDevelopment({
    Key? key,
  }) : super(key: key);

  // TODO: add first name via navigation
  // final String fname;

  @override
  _UnderDevelopmentState createState() => _UnderDevelopmentState();
}

class _UnderDevelopmentState extends State<UnderDevelopment> {
  @override
  Widget build(BuildContext context) {
    final authConsumer = useAuthProvider(context);

    return SafeArea(
        child: Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
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
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: ReplyColors.black),
        elevation: 3,
        backgroundColor: ReplyColors.white,
        title: Text(
          "${authConsumer.getUserData()["firstName"]}",
          style: const TextStyle(color: ReplyColors.orange),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: ReplyColors.black,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              //     content: Text('This is a snackbar for logout')));

              Navigator.pushNamed(context, Routes.indexPage);
            },
          ),
          /*IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next page',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Next page'),
                      ),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ));
              },
            ),*/
        ],
      ),
      body: const Center(
          child: Text(
        "Under \n Dev",
        style: TextStyle(fontSize: 24),
      )),
    ));
  }
}
