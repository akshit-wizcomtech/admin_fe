import 'package:admin_fe/components/index.dart';
import 'package:admin_fe/controller_local/index.dart';
import 'package:admin_fe/provider/auth_provider.dart';
import 'package:admin_fe/routes/index.dart';
import 'package:admin_fe/utils/index.dart';
import 'package:flutter/material.dart';

import '../../utils/them.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Pattern email_pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  bool _obscureText = true;
  bool validationEmail = false;
  bool validationPassword = false;
  String text = "";
  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isLoggingIn = false;

  @override
  Widget build(BuildContext context) {
    final authConsumer = useAuthProvider(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ReplyColors.white,
        resizeToAvoidBottomInset: false,
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage("assets/images/login_background.png"),
              fit: BoxFit.none,
            ),
          ),
          child: Column(children: <Widget>[
            //Top Containers
            Stack(
              children: [
                //Rectangular top container
                Container(
                  width: MediaQuery.of(context).size.width * 20,
                  height: MediaQuery.of(context).size.height / 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ReplyColors.indigo_400,
                  ),
                  margin:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 65.0),
                ),
                // Circular container; can be changed later to ClipOval or Circular
                Container(
                  width: MediaQuery.of(context).size.width * 20,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ReplyColors.white,
                    border: Border.all(),
                  ),
                  margin: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 20.0, bottom: 5.0),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Card(
                  elevation: 20,
                  shadowColor: ReplyColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  margin: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 10.0, bottom: 20.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                top: 20.5, bottom: 20.5, left: 18),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Login Here",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: ReplyColors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          //Form field for user email address
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: InputTextField(
                              hintText: "Enter Email*",
                              helperText: " ",
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 16),
                                    child: const Icon(
                                      Icons.email,
                                      color: ReplyColors.orange,
                                    ),
                                  ),
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
                            ),
                          ),

                          const SizedBox(height: 10),

                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: InputTextField(
                              hintText: "Password*",
                              helperText: " ",
                              controller: _password,
                              obscureText: _obscureText,
                              enableSuggestions: false,
                              autocorrect: false,
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _toggle();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 16),
                                      child: Icon(
                                        _obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: ReplyColors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 16),
                                    child: const Icon(
                                      Icons.lock,
                                      color: ReplyColors.orange,
                                    ),
                                  ),
                                ],
                              ),
                              onChange: (String value) {},
                              validator: (String? value) {
                                Map<String, dynamic> validations = {};

                                if (value?.isEmpty == true) {
                                  validations["error"] = true;
                                  validations["message"] =
                                      "Password is required";
                                }

                                return validations;
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          //Form field for password
                          //_password_formfield(),
                          const SizedBox(height: 10),
                          _forgotPasswordText(),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
                Button(
                    text: 'LOGIN',
                    isLoading: isLoggingIn,
                    disabled: isLoggingIn,
                    onTap: () {
                      final currentFocus = FocusScope.of(context);

                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoggingIn = true;
                        });

                        _formKey.currentState!.save();
                        loginCheck(context, _email.text, _password.text)
                            .then((value) {
                          if (value) {
                            authConsumer.reloadLoginState();
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, Routes.indexPage, (route) => false);
                            });
                          }
                        }).whenComplete(() {
                          setState(() {
                            isLoggingIn = false;
                          });
                        });
                      }
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    })
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'New User ? Click',
                    style: TextStyle(color: ReplyColors.white, fontSize: 13),
                  ),
                  //button for here link
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.profileSelectionPage);
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.all(5),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Here',
                      style: (TextStyle(fontSize: 17, color: ReplyColors.red)),
                    ),
                  ),

                  const Text(
                    'To Create Account',
                    style: TextStyle(color: ReplyColors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  _username_formfield() {
    return Column(
      children: [
        Container(
          // constraints: BoxConstraints.expand(width: 200.0, height: 45.0),
          margin: const EdgeInsets.symmetric(horizontal: 34),
          //this logic is used to when email is null a click login the
          //show a border as a error
          decoration: validationEmail
              ? BoxDecoration(
                  border: Border.all(color: ReplyColors.red_900),
                  borderRadius: const BorderRadius.all(
                    Radius.circular((50.0)),
                  ))
              : BoxDecoration(
                  border: Border.all(color: ReplyColors.transparent)),
          child: Card(
            margin: const EdgeInsets.all(1.0),
            borderOnForeground: false,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(47.0),
            ),
            //used to give hint text in email box
            child: Padding(
              padding: const EdgeInsets.only(left: 1),
              child: TextFormField(
                //enabled: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Enter Email',
                    errorStyle: TextStyle(fontSize: 10),
                    prefixIcon: Icon(
                      Icons.email,
                      color: ReplyColors.orange,
                    ),
                    border: InputBorder.none),
                //this is for validation
                onChanged: (String value) {
                  setState(() {
                    validationEmail = false;
                    text = "";
                  });
                },
                validator: (value) {
                  setState(() {
//                    validationEmail = value!.isEmpty;
                    if (value == null || value.isEmpty) {
                      validationEmail = true;
                      text = "Please Enter Email Address";
                    } else if (value.isNotEmpty) {
                      RegExp regex = RegExp(email_pattern.toString());
                      if (!regex.hasMatch(value)) {
                        // return null;
                        validationEmail = true;
                        text = "Please Enter a Valid Email Address";
                      } else {
                        validationEmail = false;
                        text = "";
                      }
                    } else {
                      validationEmail = false;
                      text = "";
                    }
                  });
                  return null;
                  //value!.isEmpty ?" Please enter email": null
                },
              ),
            ),
          ),
        ),
        //this is used to give the error masg of email block when we
        //not write and click login
        Padding(
          padding: const EdgeInsets.only(left: 60.0, top: 7, bottom: 2),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              validationEmail ? text : "",
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 12,
                color: ReplyColors.red_900,
                //decoration: TextDecoration.
              ),
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
      ],
    );
  }

  /* _password_formfield() {
    return Column(
      children: [
        Container(
          // constraints: BoxConstraints.expand(width: 200.0, height: 45.0),
          margin: EdgeInsets.symmetric(horizontal: 34),
          //this logic is used to when email is null a click login the
          //show a border as a error
          decoration: validationPassword
              ? BoxDecoration(
              border: Border.all(color: Color(0xffFF0000)),
              borderRadius: const BorderRadius.all(
                Radius.circular((50.0)),
              ))
              : BoxDecoration(border: Border.all(color: Colors.transparent)),
          child: Card(
            margin: EdgeInsets.all(1.0),
            borderOnForeground: false,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(47.0),
            ),
            //used to give hint text in email box
            child: Padding(
              padding: EdgeInsets.only(left: 1),
              child: TextFormField(
                //enabled: true,
                obscureText: _obscureText,
                decoration: const InputDecoration(
                    hintText: 'Enter Password',
                    errorStyle: TextStyle(fontSize: 10),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                      color: Colors.black,
                      splashRadius: 20,
                      onPressed: _toggle,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.orange,
                    ),


                    border: InputBorder.none),
                //this is for validation
                onChanged: (String value) {
                  setState(() {
                    validationEmail = false;
                    text = "";
                  });
                },
                validator: (value) {
                  setState(() {
//                    validationEmail = value!.isEmpty;
                    if (value == null || value.isEmpty) {
                      validationEmail = true;
                      text = "Please Enter Email Address";
                    } else if (value.isNotEmpty) {
                      RegExp regex = RegExp(email_pattern.toString());
                      if (!regex.hasMatch(value)) {
                        // return null;
                        validationEmail = true;
                        text = "Please Enter a Valid Email Address";
                      } else {
                        validationEmail = false;
                        text = "";
                      }
                    } else {
                      validationEmail = false;
                      text = "";
                    }
                  });
                  return null;
                  //value!.isEmpty ?" Please enter email": null
                },
              ),
            ),
          ),
        ),
        //this is used to give the error masg of email block when we
        //not write and click login
        Padding(
          padding: const EdgeInsets.only(left: 60.0, top: 7, bottom: 2),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              validationEmail ? text : "",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xffFF0000),
                //decoration: TextDecoration.
              ),
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
      ],
    );

  }*/

  _forgotPasswordText() {
    return const Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 28.0),
        child: Text(
          'Forgot Password ?',
          style: TextStyle(
            fontSize: 13,
            color: ReplyColors.indigo_600,
          ),
          softWrap: false,
        ),
      ),
    );
  }
}
