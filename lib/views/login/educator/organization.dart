import 'dart:math' as math;

import 'package:admin_fe/routes/index.dart';
import 'package:flutter/material.dart';

import '../../../utils/them.dart';

class Organization extends StatefulWidget {
  const Organization({Key? key}) : super(key: key);

  @override
  _OrganizationState createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomSheet: BottomSheet(
            onClosing: () {},
            backgroundColor: ReplyColors.white,
            builder: (BuildContext context) {
              // Back button
              return Container(
                margin: const EdgeInsets.only(bottom: 10.0, left: 20),
                child: IconButton(
                  icon: Image.asset(
                    "assets/images/back.png",
                    scale: 1.5,
                  ),
                  color: ReplyColors.black,
                  splashColor: ReplyColors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              );
            }),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.95,
          width: MediaQuery.of(context).size.width * 0.99,
          child: Card(
            elevation: 5,
            shadowColor: ReplyColors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin:
                const EdgeInsets.only(top: 46, left: 16, right: 16, bottom: 91),
            color: ReplyColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 37.0, top: 10),
                  child: const Text(
                    "I Would Like To",
                    style: TextStyle(
                      color: ReplyColors.red_900,
                      fontSize: 20,
                    ),
                  ),
                ),

                //Create create org block
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pushNamed(
                        context, Routes.educatorCreateOrganizationPage);
/*
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const Personal_Details_R(name: 'Create',)
                        ),

                      );
*/
                  }, //Container for create
                  child: Container(
                    width: MediaQuery.of(context).size.width * 20,
                    height: MediaQuery.of(context).size.height / 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ReplyColors.indigo_600,
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [ReplyColors.indigo_400, ReplyColors.indigo_900],
                        )),
                    margin: const EdgeInsets.only(
                        left: 29.0, right: 17.0, top: 38.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          margin:
                              const EdgeInsets.only(top: 5, left: 4, bottom: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 19.0, bottom: 18, left: 9.6, right: 3.6),
                            child: Image.asset("assets/images/pencil.png"),
                          ),
                        ),
                        const Text(
                          "CREATE\nORGANISATION",
                          style: TextStyle(fontSize: 14, color: ReplyColors.white),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(right: 27),
                          child: Transform.rotate(
                            angle: 180 * math.pi / 180,
                            child: Image.asset("assets/images/back.png",
                                scale: 1.3, color: ReplyColors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Container for Join
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.createAccountPage);
                    /* Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Personal_Details_R(name: 'Join',)),
                      );*/
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 20,
                    height: MediaQuery.of(context).size.height / 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ReplyColors.indigo_600,
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [ReplyColors.indigo_400, ReplyColors.indigo_900],
                        )),
                    margin: const EdgeInsets.only(
                        left: 29.0, right: 17.0, top: 38.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          margin:
                              const EdgeInsets.only(top: 5, left: 4, bottom: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, bottom: 20, left: 9.6, right: 10.6),
                            child: Center(
                                child: Image.asset("assets/images/Join.png")),
                          ),
                        ),
                        const Text(
                          "JOIN\nORGANISATION",
                          style: TextStyle(fontSize: 14, color: ReplyColors.white),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(right: 27),
                          child: Transform.rotate(
                            angle: 180 * math.pi / 180,
                            child: Image.asset("assets/images/back.png",
                                scale: 1.3, color: ReplyColors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
