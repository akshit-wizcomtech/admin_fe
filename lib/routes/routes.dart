import 'package:admin_fe/views/add_pen/add_pen_manually/waiting_approval.dart';
import 'package:admin_fe/views/create_account.dart';
import 'package:admin_fe/views/index.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static const String indexPage = "/";
  static const String loginPage = "/login";
  static const String profileSelectionPage = "/profile-selection";
  static const String organizationPage = "/organization";
  static const String underDevelopmentPage = "/under-development";
  static const String createAccountPage = "/create-account";
  static const String educatorCreateOrganizationPage =
      "/educator-create-organization";
  static const String homepage = "/homepage";
  static const String howAddPen = "/how-add-pen";
  static const String registerPenManually = "/register-pen-manually";
  static const String waitingApprovalRegisterPenManually =
      "/waiting-approval-register-pen-manually";

  static Map<String, Widget Function(BuildContext)> unauthenticatedRoutes() {
    return {
      indexPage: (context) => const LoginPage(),
      loginPage: (context) => const LoginPage(),
      profileSelectionPage: (context) => const ProfileSelection(),
      organizationPage: (context) => const Organization(),
      underDevelopmentPage: (context) => const UnderDevelopment(),
      createAccountPage: (context) => const CreateAccount(),
      educatorCreateOrganizationPage: (context) => const CreateOrganization(),
    };
  }

  static Map<String, Widget Function(BuildContext)> authenticatedRoutes() {
    return {
      indexPage: (context) => const HomePage(),
      homepage: (context) => const HomePage(),
      underDevelopmentPage: (context) => const UnderDevelopment(),
      howAddPen: (context) => const HowAddPen(),
      registerPenManually: (context) => const RegisterPen(),
      waitingApprovalRegisterPenManually: (context) => const WaitingApproval()
    };
  }

  static Map<String, Widget Function(BuildContext)> all() {
    return {
      ...unauthenticatedRoutes(),
      ...authenticatedRoutes(),
      indexPage: (context) => const LoginPage(),
    };
  }
}
