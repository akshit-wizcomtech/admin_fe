import 'package:admin_fe/provider/index.dart';
import 'package:admin_fe/routes/index.dart';
import 'package:flutter/material.dart';

import '../../utils/them.dart';

class ProfileSelection extends StatefulWidget {
  const ProfileSelection({Key? key}) : super(key: key);

  @override
  State<ProfileSelection> createState() => _ProfileSelectionState();
}

class _ProfileSelectionState extends State<ProfileSelection> {
  @override
  Widget build(BuildContext context) {
    final registerationConsumer = useRegisterationProvider(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              //An educator stack
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 29.0),
                    child: Text(
                      "I am",
                      style: TextStyle(
                        fontSize: 27,
                        color: Color(0xff000000),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      registerationConsumer.updateProfileSelection("educator");
                      Navigator.pushNamed(context, Routes.organizationPage);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 20,
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff58669A), Color(0xff202538)],
                          )),
                      margin: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 52.0),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "An Educator",
                              style: TextStyle(
                                  fontSize: 19, color: ReplyColors.white),
                            ),
                            SizedBox(height: 8.5),
                            Text(
                                "This option is for educators at school,\ncolleges , Universities, and other institutions",
                                style: TextStyle(
                                    fontSize: 11, color: ReplyColors.white_70)),
                            SizedBox(
                              height: 44,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 10,
                    height: 95,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ReplyColors.white,
                    ),
                    margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Image.asset("assets/images/educator_icon.png",
                        //color:  Colors.yellow,
                        color: ReplyColors.yellow_600),
                  ),
                ],
              ),
              // A Student / individual stack
              Stack(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      registerationConsumer
                          .updateProfileSelection("student/individual");
                      // Todo: add student navigation
/*
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Personal_Details_R(name: 'student')),
                          //   MaterialPageRoute(builder: (context) => const underDevelopment()),
                        );
*/
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 20,
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              ReplyColors.indigo_400,
                              ReplyColors.indigo_900
                            ],
                          )),
                      margin: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 52.0),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "A Student/Individual",
                              style: TextStyle(
                                  fontSize: 19, color: ReplyColors.white),
                            ),
                            SizedBox(height: 8.5),
                            Text(
                                "This option is for student or owner who\nowns a pen.",
                                style: TextStyle(
                                    fontSize: 11, color: ReplyColors.white_70)),
                            SizedBox(
                              height: 44,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 10,
                    height: 95,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ReplyColors.white,
                    ),
                    margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Image.asset(
                      "assets/images/individual_icon.png",
                      color: ReplyColors.yellow_600,
                    ),
                  ),
                ],
              ),
              // A Parent / Carer
              Stack(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      registerationConsumer
                          .updateProfileSelection("parent/career");
                      // Todo: add parent navigation
/*
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Personal_Details_R(name: 'parent')),
                          //   MaterialPageRoute(builder: (context) => const underDevelopment()),
                        );
*/
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 20,
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              ReplyColors.indigo_400,
                              ReplyColors.indigo_900
                            ],
                          )),
                      margin: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 52.0),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "A Parent / Carer",
                              style: TextStyle(
                                  fontSize: 19, color: ReplyColors.white),
                            ),
                            SizedBox(height: 8.5),
                            Text(
                                "This option is for parent or carer of a student.",
                                style: TextStyle(
                                    fontSize: 11, color: ReplyColors.white_70)),
                            SizedBox(
                              height: 44,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 10,
                    height: 95,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ReplyColors.white,
                    ),
                    margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Image.asset(
                      "assets/images/family_icon.png",
                      color: ReplyColors.yellow_600,
                    ),
                  ),
                ],
              ),
              //Back button
              Container(
                margin: const EdgeInsets.only(left: 29, top: 30),
                child: IconButton(
                  icon: Image.asset(
                    "assets/images/back.png",
                    scale: 1.5,
                  ),
                  color: ReplyColors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              /*   Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 20,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xff404A6F),
                      ),
                      margin: const EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 75.0),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 20,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(),
                      ),
                      margin: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 30.0, bottom: 5.0),
                    ),
                  ],
                ),*/
            ],
          ),
        ),
      ),
    );
  }
}
