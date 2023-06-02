import 'package:admin_fe/components/index.dart';
import 'package:admin_fe/provider/index.dart';
import 'package:admin_fe/utils/index.dart';
import 'package:flutter/material.dart';

class PersonalDetailsTab extends StatefulWidget {
  const PersonalDetailsTab({Key? key, required this.formKey}) : super(key: key);

  // final Function(Function) onNext;
  // final Function(Function) onPrevious;
  final GlobalKey<FormState> formKey;
  // final Function incrementTab;
  // final Function decrementTab;

  @override
  State<PersonalDetailsTab> createState() => _PersonalDetailsTabState();
}

class _PersonalDetailsTabState extends State<PersonalDetailsTab> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerationConsumer = useRegisterationProvider(context);
    return Form(
      // key: widget.formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Wrap(
          runSpacing: 8,
          children: [
            // Container(
            //   child: Text(
            //     '* Required Information',
            //     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            //   ),
            //   alignment: Alignment.topLeft,
            //   padding: EdgeInsets.only(bottom: 10),
            // ),
            InputTextField(
              hintText: "Title",
              keyboardType: TextInputType.text,
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                        left: 16,
                      ),
                      child: Image.asset("assets/images/title_icon.png")),
                ],
              ),
              onChange: (String value) {},
              validator: (String? value) {
                Map<String, dynamic> validations = {};

                return validations;
              },
              initialValue: registerationConsumer.userMaster.title,
              onSaved: (String? value) {
                registerationConsumer.updateUserMaster(title: value);
              },
            ),
            InputTextField(
              hintText: "Enter First Name*",
              keyboardType: TextInputType.name,
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                        left: 16,
                      ),
                      child: Image.asset("assets/images/user_icon.png")),
                ],
              ),
              onChange: (String value) {},
              validator: (String? value) {
                Map<String, dynamic> validations = {};

                if (value?.isEmpty == true) {
                  validations["error"] = true;
                  validations["message"] = "First name is required";
                }

                return validations;
              },
              initialValue: registerationConsumer.userMaster.firstName,
              onSaved: (String? value) {
                registerationConsumer.updateUserMaster(firstName: value);
              },
            ),
            InputTextField(
              hintText: "Enter Last Name*",
              keyboardType: TextInputType.name,
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                        left: 16,
                      ),
                      child: Image.asset("assets/images/user_icon.png")),
                ],
              ),
              onChange: (String value) {},
              validator: (String? value) {
                Map<String, dynamic> validations = {};

                if (value?.isEmpty == true) {
                  validations["error"] = true;
                  validations["message"] = "Last name is required";
                }

                return validations;
              },
              initialValue: registerationConsumer.userMaster.lastName,
              onSaved: (String? value) {
                registerationConsumer.updateUserMaster(lastName: value);
              },
            ),
            InputTextField(
              hintText: "Enter Email*",
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                        left: 16,
                      ),
                      child: Image.asset("assets/images/email_icon.png")),
                ],
              ),
              onChange: (String value) {},
              validator: (String? value) {
                Map<String, dynamic> validations = {};

                if (value?.isEmpty == true) {
                  validations["error"] = true;
                  validations["message"] = "Email is required";
                } else if (!Validate.email(value ?? "")) {
                  validations["error"] = true;
                  validations["message"] = "Enter valid email";
                }

                return validations;
              },
              initialValue: registerationConsumer.userMaster.userId,
              onSaved: (String? value) {
                registerationConsumer.updateUserMaster(userId: value);
              },
            ),
            InputTextField(
              hintText: "Enter Mobile Number",
              keyboardType: TextInputType.phone,
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                        left: 16,
                      ),
                      child: Image.asset("assets/images/contact_icon.png")),
                ],
              ),
              onChange: (String value) {},
              validator: (String? value) {
                Map<String, dynamic> validations = {};

                return validations;
              },
              initialValue: registerationConsumer.userMaster.mobileNumber,
              onSaved: (String? value) {
                registerationConsumer.updateUserMaster(mobileNumber: value);
              },
            ),
            InputTextField(
              hintText: "Enter Address",
              keyboardType: TextInputType.streetAddress,
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Image.asset(
                        "assets/images/address_icon.png",
                      )),
                ],
              ),
              onChange: (String value) {},
              validator: (String? value) {
                Map<String, dynamic> validations = {};

                return validations;
              },
              initialValue: registerationConsumer.userMaster.address,
              onSaved: (String? value) {
                registerationConsumer.updateUserMaster(address: value);
              },
            ),
            Container(
              constraints: const BoxConstraints.expand(width: 350, height: 50),
              margin: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/newsletter_icon.png",
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20, left: 10),
                    child: Text(
                      "News Letter",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Radio(
                      value: "1",
                      groupValue: registerationConsumer.userMaster.newsletter,
                      onChanged: (value) {
                        registerationConsumer.updateUserMaster(
                            newsletter: value);
                        // setState(() {
                        //   _radio = value;
                        // });
                      }),
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 15,
                    ),
                    child: Text(
                      "Yes",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Radio(
                      value: "0",
                      groupValue: registerationConsumer.userMaster.newsletter,
                      onChanged: (value) {
                        registerationConsumer.updateUserMaster(
                            newsletter: value);
                        // setState(() {
                        //   _radio = value;
                        // });
                      }),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "No",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
