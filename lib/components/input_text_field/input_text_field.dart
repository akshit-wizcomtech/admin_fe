import 'package:admin_fe/utils/them.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    Key? key,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.onChange,
    this.validator,
    this.hintText,
    this.obscureText,
    this.enableSuggestions,
    this.autocorrect,
    this.controller,
    this.helperText,
    this.initialValue,
    this.onSaved,
  }) : super(key: key);

  final TextInputType? keyboardType;
  final Row? prefixIcon;
  final Row? suffixIcon;
  final String? hintText;
  final void Function(String)? onChange;
  final Map<String, dynamic> Function(String?)? validator;
  final bool? obscureText;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final TextEditingController? controller;
  final String? helperText;
  final String? initialValue;
  final Function(String?)? onSaved;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool isError = false;

  final _textFormFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            // width: double.infinity,
            height: 57,
            decoration: BoxDecoration(
              color: ReplyColors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 6,
                  color: ReplyColors.black45,
                  // spreadRadius: 0.5,
                  offset: Offset(
                    0,
                    3,
                  ),
                ),
              ],
              borderRadius: BorderRadius.circular(40),
            )),
        TextFormField(
          key: _textFormFieldKey,
          onSaved: widget.onSaved,
          initialValue: widget.initialValue,
          controller: widget.initialValue == null ? widget.controller : null,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          obscureText: widget.obscureText ?? false,
          autocorrect: widget.autocorrect ?? true,
          enableSuggestions: widget.enableSuggestions ?? true,
          decoration: InputDecoration(
            hintText: widget.hintText ?? 'Enter ...',
            helperText: widget.helperText,
            errorStyle: const TextStyle(fontSize: 10),
            prefixIcon: widget.prefixIcon ?? const SizedBox(),
            suffixIcon: widget.suffixIcon ?? const SizedBox(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                  style: isError ? BorderStyle.solid : BorderStyle.none,
                  width: isError ? 1 : 0),
            ),
          ),
          onChanged: (String value) {
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
        )
      ],
    );
  }
}
