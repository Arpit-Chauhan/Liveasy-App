import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.validator,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
            controller: controller,
            focusNode: focusNode ?? FocusNode(),
            autofocus: autofocus!,
            // style: textStyle ?? CustomTextStyles.bodyLargeGray600,
            obscureText: obscureText!,
            textInputAction: textInputAction,
            keyboardType: textInputType,
            maxLines: maxLines ?? 1,
            decoration: decoration,
            validator: validator,
            autovalidateMode: AutovalidateMode.always,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        // hintStyle: hintStyle ?? CustomTextStyles.bodyLargeGray600,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding,
        border: InputBorder.none,
      );
}
