import 'package:admin_fe/components/index.dart';
import 'package:admin_fe/provider/index.dart';
import 'package:admin_fe/utils/index.dart';
import 'package:admin_fe/utils/them.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class OrganizationTab extends StatefulWidget {
  const OrganizationTab({Key? key, required this.formKey}) : super(key: key);

  // final Function(Function) onNext;
  // final Function(Function) onPrevious;
  final GlobalKey<FormState> formKey;
  // final Function incrementTab;
  // final Function decrementTab;

  @override
  State<OrganizationTab> createState() => _OrganizationTabState();
}

class _OrganizationTabState extends State<OrganizationTab> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    final registerationConsumer = useRegisterationProvider(context);

    return Form(
      key: widget.formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Wrap(
          runSpacing: 8,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(bottom: 10),
              child: const Text(
                '* Required Information',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
            InputDropdown(
              hintText: "Organisation Type*",
              keyboardType: TextInputType.text,
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Image.asset("assets/images/org_icon.png")),
                ],
              ),
              items: const [
                DropdownMenuItem(
                  value: "Primary School",
                  child: Text("Primary School"),
                ),
                DropdownMenuItem(
                  value: "Secondary School",
                  child: Text("Secondary School"),
                ),
                DropdownMenuItem(
                  value: "College",
                  child: Text("College"),
                ),
                DropdownMenuItem(
                  value: "University",
                  child: Text("University"),
                ),
              ],
              value: registerationConsumer.organisationMaster.orgType == ""
                  ? null
                  : registerationConsumer.organisationMaster.orgType,
              onChange: (String? value) {
                registerationConsumer.updateOrganisationMaster(orgType: value);
              },
              validator: (String? value) {
                Map<String, dynamic> validations = {};

                if (value == null) {
                  validations["error"] = true;
                  validations["message"] = "Organization type is required";
                }

                return validations;
              },
            ),
            InputTextField(
              hintText: "Organisation Name*",
              keyboardType: TextInputType.name,
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Image.asset("assets/images/org_icon.png")),
                ],
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: const Icon(
                      Icons.search,
                      color: ReplyColors.black,
                    ),
                  )
                ],
              ),
              onChange: (String value) {},
              validator: (String? value) {
                Map<String, dynamic> validations = {};

                if (value?.isEmpty == true) {
                  validations["error"] = true;
                  validations["message"] = "Organization name is required";
                }

                return validations;
              },
              initialValue: registerationConsumer.organisationMaster.orgName,
              onSaved: (String? value) {
                String? orgId = "${value}1";
                registerationConsumer.updateOrganisationMaster(
                    orgName: value, orgId: orgId);
                registerationConsumer.updateUserMaster(orgId: orgId);
              },
            ),
            InputTextField(
              hintText: "Organisation Address*",
              keyboardType: TextInputType.text,
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

                if (value?.isEmpty == true) {
                  validations["error"] = true;
                  validations["message"] = "Organization address is required";
                }

                return validations;
              },
              initialValue: registerationConsumer.organisationMaster.orgAddress,
              onSaved: (String? value) {
                registerationConsumer.updateOrganisationMaster(
                    orgAddress: value);
              },
            ),
            InputDropdown(
              hintText: "Country",
              keyboardType: TextInputType.text,
              items: const [
                DropdownMenuItem(
                  value: "UK",
                  child: Text("UK"),
                ),
              ],
              value: registerationConsumer.organisationMaster.country == ""
                  ? null
                  : registerationConsumer.organisationMaster.country,
              onChange: (String? value) {
                registerationConsumer.updateOrganisationMaster(country: value);
              },
              validator: (String? value) {
                Map<String, dynamic> validations = {};

                if (value == null) {
                  validations["error"] = true;
                  validations["message"] = "Country is required";
                }

                return validations;
              },
            ),
            InputTextField(
              hintText: "Zip Code*",
              keyboardType: TextInputType.text,
              onChange: (String value) {},
              validator: (String? value) {
                Map<String, dynamic> validations = {};

                if (value?.isEmpty == true) {
                  validations["error"] = true;
                  validations["message"] = "Zip code is required";
                } else if (!Validate.ukPostalCode(value ?? "")) {
                  validations["error"] = true;
                  validations["message"] = "Invalid zip code";
                }

                return validations;
              },
              initialValue: registerationConsumer.organisationMaster.zipcode,
              onSaved: (String? value) {
                registerationConsumer.updateOrganisationMaster(zipcode: value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
