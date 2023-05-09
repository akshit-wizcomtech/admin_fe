import 'package:admin_fe/components/index.dart';
import 'package:admin_fe/layout/index.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  int activeTabIndex = 0;

  void changeActiveTabIndex(int index) {
    setState(() {
      activeTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 26, 0, 0),
              child: const LoginHeader(
                title: "Create Account",
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 26, 0, 0),
              child: IconTab(
                tabs: const [
                  {"title": "Organization\nDetails", "icon": Icons.people},
                  {"title": "Personal\nDetails", "icon": Icons.person},
                  {"title": "Password\nDetails", "icon": Icons.lock},
                ],
                activeTabIndex: activeTabIndex,
                changeActiveTabIndex: changeActiveTabIndex,
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: IndexedStack(
                index: activeTabIndex,
                children: [
                  Column(
                    children: const [
                      Text(
                        "Organisation Details",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        "Personal Details",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        "Password Details",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ))
          ]),
        ),
      ),
    );
  }
}
