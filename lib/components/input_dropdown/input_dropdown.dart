import 'dart:math' as math;

import 'package:flutter/material.dart';

class InputDropdown extends StatefulWidget {
  const InputDropdown(
      {Key? key,
      this.keyboardType,
      this.prefixIcon,
      this.suffixIcon,
      this.hintText,
      this.onChange,
      this.validator,
      this.obscureText,
      this.enableSuggestions,
      this.autocorrect,
      this.controller,
      required this.items,
      this.value,
      this.onSaved})
      : super(key: key);

  final TextInputType? keyboardType;
  final Row? prefixIcon;
  final Row? suffixIcon;
  final String? hintText;
  final void Function(String?)? onChange;
  final Map<String, dynamic> Function(String?)? validator;
  final bool? obscureText;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final TextEditingController? controller;
  final List<DropdownMenuItem<String>> items;
  final String? value;
  final Function(String?)? onSaved;

  @override
  State<InputDropdown> createState() => _InputDropdownState();
}

class _InputDropdownState extends State<InputDropdown> {
  bool isError = false;

  final _textFormFieldKey = GlobalKey<FormFieldState>();

  Object a = {};

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: !isError ? Alignment.center : AlignmentDirectional.topStart,
      children: [
        Container(
            // width: double.infinity,
            height: 57,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 6,
                  color: Colors.black45,
                  // spreadRadius: 0.5,
                  offset: Offset(
                    0,
                    3,
                  ),
                ),
              ],
              borderRadius: BorderRadius.circular(40),
            )),
        SizedBox(
          height: isError ? 78 : null,
          child: DropdownButtonFormField<String>(
            key: _textFormFieldKey,
            onSaved: widget.onSaved,
            menuMaxHeight: 214,
            value: widget.value,
            // controller: _textFormFieldController,
            // keyboardType: widget.keyboardType ?? TextInputType.text,
            // obscureText: widget.obscureText ?? false,
            // autocorrect: widget.autocorrect ?? true,
            // enableSuggestions: widget.enableSuggestions ?? true,
            decoration: InputDecoration(
              hintText: widget.hintText ?? 'Enter ...',
              // helperText: " ",
              errorStyle: const TextStyle(fontSize: 10),
              prefixIcon: widget.prefixIcon ?? const SizedBox(),
              // suffixIcon: widget.suffixIcon ?? SizedBox(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(
                    style: isError ? BorderStyle.solid : BorderStyle.none,
                    width: isError ? 1 : 0),
              ),
            ),

            icon: Container(
              margin: const EdgeInsets.only(right: 16),
              child: Transform.rotate(
                angle: 270 * math.pi / 180,
                child: Image.asset(
                  "assets/icons/arrow_left.png",
                  // scale: 1.5,
                ),
              ),
            ),
            iconEnabledColor: Colors.black,
            style: const TextStyle(color: Colors.black, fontSize: 20),
            // dropdownColor: Colors.red,
            // underline: Container(),
            // isExpanded: true,
            onChanged: (String? value) {
              _textFormFieldKey.currentState?.validate();
              if (widget.onChange != null) {
                widget.onChange!(value);
              }
            },
            validator: (String? value) {
              if (widget.validator != null) {
                Map<String, dynamic>? validations = widget.validator!(value);
                setState(() {
                  isError = validations["error"] ?? false;
                });
                return validations["message"];
              }
              return null;
            },
            items: [
              // DropdownMenuItem(
              //   value: "United Kingdom",
              //   child: Text("United Kingdom"),
              // ),
              ...widget.items
            ],
          ),
        )
      ],
    );
  }
}

// import 'package:flutter/material.dart';
//
// class InputDropdown extends StatefulWidget {
//   const InputDropdown({Key? key}) : super(key: key);
//
//   @override
//   State<InputDropdown> createState() => _InputDropdownState();
// }
//
// class _InputDropdownState extends State<InputDropdown> {
//   String hint_dropdpwn = "Select Option";
//   List<String> typeList = [
//     'Primary School',
//     'University',
//     'Secondary School',
//     'College'
//   ];
//   bool isOpen = false;
//   TextEditingController controller = new TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 50,
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(0),
//                   border: Border.all(color: Colors.grey),
//                 ),
//                 child: TextField(
//                   controller: controller,
//                   enableInteractiveSelection: false,
// // will disable paste operation
// //                   focusNode: AlwaysDisabledFocusNode(),
//                   decoration: InputDecoration(
//                       hintText: hint_dropdpwn,
//                       border: InputBorder.none,
//                       suffixIcon: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isOpen = !isOpen;
//                             });
//                           },
//                           child: Icon(isOpen
//                               ? Icons.keyboard_arrow_up
//                               : Icons.keyboard_arrow_down))),
//                 ),
//               ),
//               isOpen
//                   ? Container(
//                       height: 100,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.3),
//                               spreadRadius: 1,
//                               blurRadius: 3,
//                               offset: Offset(0, 1),
//                             )
//                           ]
// // border: Border.all(color: Colors.grey),
//                           ),
//                       child: ListView.builder(
//                           itemCount: typeList.length,
//                           itemBuilder: ((context, index) {
//                             return GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   controller.text = typeList[index];
//                                   isOpen = false;
//                                 });
//                               },
//                               child: ListTile(
//                                 title: Text(typeList[index]),
//                               ),
//                             );
//                           })),
//                     )
//                   : SizedBox(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
