import 'package:admin_fe/layout/index.dart';
import 'package:admin_fe/provider/index.dart';
import 'package:admin_fe/utils/index.dart';
import 'package:admin_fe/views/index.dart';
import 'package:flutter/material.dart';

const Tabs = [
  {"title": "Organization\nDetails", "icon": Icons.people},
  {"title": "Personal\nDetails", "icon": Icons.person},
  {"title": "Password\nDetails", "icon": Icons.lock},
];

class CreateOrganization extends StatefulWidget {
  const CreateOrganization({Key? key}) : super(key: key);

  @override
  State<CreateOrganization> createState() => _CreateOrganizationState();
}

class _CreateOrganizationState extends State<CreateOrganization> {
  // Function? onPreviousHandler = null;
  //
  // void tabDedicatedUpdateOnPreviousHandler(Function cb) {
  //   if (onPreviousHandler == null ) {
  //     print("previous handler re initiaslised");
  //     setState(() {
  //       onPreviousHandler = cb;
  //     });
  //   }
  // }
  // Function? onNextHandler = null;
  //
  // void tabDedicatedUpdateOnNextHandler(Function cb) {
  //   if (onNextHandler == null) {
  //     setState(() {
  //       onNextHandler = cb;
  //     });
  //   }
  // }
  //
  // void reInitialiseFunctionState() {
  //   setState(() {
  //     onPreviousHandler = null;
  //     onNextHandler = null;
  //   });
  // }

  // int activeTabIndex = 0;
  // void changeActiveTabIndex(int index) {
  //   setState(() {
  //     if (index > 0) {
  //
  //     } else {
  //       activeTabIndex = index;
  //     }
  //   });
  //   // reInitialiseFunctionState();
  // }

  // void incrementActiveTab() {
  //   print("tab incremented");
  //   setState(() {
  //     print("tab incremented ${activeTabIndex} ${Tabs.length}");
  //     if (activeTabIndex < Tabs.length - 1) {
  //       print("tab incremented by 1");
  //       activeTabIndex += 1;
  //     }
  //   });
  //   // reInitialiseFunctionState();
  // }
  //
  // void decrementActiveTab() {
  //   setState(() {
  //     if (activeTabIndex > 0) {
  //       activeTabIndex += 1;
  //     }
  //   });
  //   // reInitialiseFunctionState();
  // }

  final _formKeyOrganizationTab = GlobalKey<FormState>();
  final _formKeyPersonalDetailsTab = GlobalKey<FormState>();
  final _formKeyPasswordDetailsTab = GlobalKey<FormState>();

  int activeTabIndex = 0;

  // TODO: close keyboard
  void changeActiveTabIndex(int index) {
    if (index >= 0 && index < Tabs.length) {
      var activeFormKey = [
        _formKeyOrganizationTab,
        _formKeyPersonalDetailsTab,
        _formKeyPasswordDetailsTab
      ][activeTabIndex];

      if (activeFormKey.currentState!.validate()) {
        activeFormKey.currentState!.save();
        setState(() {
          activeTabIndex = index;
        });
      } else if (index < activeTabIndex) {
        setState(() {
          activeTabIndex = index;
        });
      }
    }
    hideKeyboard(context);
  }

  @override
  Widget build(BuildContext context) {
    final registerationConsumer = useRegisterationProvider(context);
    return CreateAccountLayout(
      loginHeader: const {"title": "Create Account"},
      loginHeaderArrowCallback: () {
        Navigator.pop(context);
        registerationConsumer.resetProviderState();
      },
      tabs: Tabs,
      activeTabIndex: activeTabIndex,
      changeActiveTabIndex: changeActiveTabIndex,
      tabWidgets: [
        OrganizationTab(
          key: UniqueKey(),
          // onNext: tabDedicatedUpdateOnNextHandler,
          // onPrevious: tabDedicatedUpdateOnPreviousHandler,
          formKey: _formKeyOrganizationTab,
        ),
        PersonalDetailsTab(
          key: UniqueKey(),
          // onNext: tabDedicatedUpdateOnNextHandler,
          // onPrevious: tabDedicatedUpdateOnPreviousHandler,
          formKey: _formKeyPersonalDetailsTab,
        ),
        PasswordDetailsTab(
          key: UniqueKey(),
          // onNext: tabDedicatedUpdateOnNextHandler,
          // onPrevious: tabDedicatedUpdateOnPreviousHandler,
          formKey: _formKeyPasswordDetailsTab,
        ),
      ],
      // onPrevious: onPreviousHandler ?? () {},
      // onNext: onNextHandler ?? () {},
      onPrevious: [
        () {
          Navigator.pop(context);
          registerationConsumer.resetProviderState();
        },
        () {
          changeActiveTabIndex(0);
        },
        () {
          changeActiveTabIndex(1);
        }
      ][activeTabIndex],
      onNext: [
        () {
          changeActiveTabIndex(1);
        },
        () {
          changeActiveTabIndex(2);
        },
        null,
      ][activeTabIndex],
    );
  }
}
