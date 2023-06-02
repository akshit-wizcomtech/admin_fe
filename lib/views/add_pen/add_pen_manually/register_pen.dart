import 'package:admin_fe/components/index.dart';
import 'package:admin_fe/controller_local/index.dart';
import 'package:admin_fe/layout/index.dart';
import 'package:admin_fe/routes/index.dart';
import 'package:admin_fe/utils/index.dart';
import 'package:admin_fe/utils/them.dart';
import 'package:flutter/material.dart';

class RegisterPen extends StatefulWidget {
  const RegisterPen({Key? key}) : super(key: key);

  @override
  State<RegisterPen> createState() => _RegisterPenState();
}

class _RegisterPenState extends State<RegisterPen> {
  Map penRecord = {};
  TextEditingController _serialNumber = TextEditingController();
  bool isSerialNumberLoading = false;
  bool isSerialNumberHitTouched = false;
  bool isSerialNumberValid = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: const {
        "title": Text(
          'Add Pen',
          style: TextStyle(color: ReplyColors.white),
        )
      },
      layoutChild: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // margin: const EdgeInsets.only(top: 100),
                    child: InputTextField(
                      controller: _serialNumber,
                      keyboardType: TextInputType.number,
                      hintText: "Enter Serial Number",
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // if (isSerialNumberLoading)
                          //   const SizedBox(
                          //     width: 12,
                          //     height: 12,
                          //     child: CircularLoader(),
                          //   ),
                          if (!isSerialNumberLoading &&
                              isSerialNumberHitTouched)
                            Container(
                              margin: const EdgeInsets.only(right: 16),
                              child: Icon(
                                isSerialNumberValid
                                    ? Icons.task_alt_outlined
                                    : Icons.close,
                                color: isSerialNumberValid
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                        ],
                      ),
                      onChange: (String value) async {
                        setState(() {
                          isSerialNumberValid = false;
                          isSerialNumberHitTouched = false;
                        });
                      },
                      validator: (String? value) {
                        return Validate.serialNumberValidation(value);
                      },
                    ),
                  ),
                  if (!isSerialNumberValid)
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: Button(
                          text: "Submit",
                          border: Border.all(width: 0),
                          borderRadius: BorderRadius.circular(10),
                          isLoading: isSerialNumberLoading,
                          onTap: () async {
                            if (!Validate.serialNumberValidation(
                                _serialNumber.text)["error"]) {
                              setState(() {
                                isSerialNumberHitTouched = true;
                                isSerialNumberLoading = true;
                              });
                              final result = await addPenManuallyHandler(
                                  serialNumber: _serialNumber.text);
                              // TODO: Add status = new, Registered, pending, Requested, App_A Actions
                              if (result.isNotEmpty) {
                                final record = result[0];

                                setState(() {
                                  isSerialNumberValid =
                                      (record["registeredStatus"] == "new");
                                  if (isSerialNumberValid) {
                                    penRecord = record;
                                  }
                                });
                              } else {
                                setState(() {
                                  isSerialNumberValid = false;
                                });
                              }

                              setState(() {
                                isSerialNumberLoading = false;
                              });
                            }
                          }),
                    ),
                  if (isSerialNumberValid) ...{
                    Container(
                      margin: const EdgeInsets.only(top: 48),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Pen Type",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 76, right: 76, bottom: 8),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black))),
                                child: Text(
                                  "${penRecord["type"]}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              // SizedBox(
                              //   width: double.infinity,
                              // )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 120),
                      child: Button(
                          text: "Register Now",
                          border: Border.all(width: 0),
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            Navigator.pushNamed(context,
                                Routes.waitingApprovalRegisterPenManually);
                          }),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.only(top: 120),
                    //   child: const Text(
                    //     "Do You Want To Register?",
                    //     style: TextStyle(
                    //         fontSize: 19,
                    //         fontWeight: FontWeight.bold,
                    //         color: Color(0xff404A6F)),
                    //   ),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.only(top: 40),
                    //   padding: const EdgeInsets.symmetric(horizontal: 48),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Button(
                    //           text: "Now",
                    //           border: Border.all(width: 0),
                    //           borderRadius: BorderRadius.circular(10),
                    //           onTap: () {
                    //             Navigator.pushNamed(context,
                    //                 Routes.waitingApprovalRegisterPenManually);
                    //           }),
                    //       Button(
                    //         text: "Later",
                    //         border: Border.all(width: 0),
                    //         borderRadius: BorderRadius.circular(10),
                    //         onTap: () {
                    //           Navigator.pushNamedAndRemoveUntil(
                    //               context, Routes.indexPage, (route) => false);
                    //         },
                    //       )
                    //     ],
                    //   ),
                    // )
                  }
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Change pen settings",
                    style: TextStyle(decoration: TextDecoration.underline),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      showBottomSheet: false,
    );
  }
}
