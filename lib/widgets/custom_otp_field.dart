import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class CustomOtpTextField extends StatelessWidget {
  CustomOtpTextField({
    Key? key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  Function(String) onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

 

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
        autofocus: true,
        controller: controller,
        hideCharacter: false,
        highlight: true,
        pinBoxColor: Color(0xFF93D2F3),
        highlightColor: Colors.blue,
        defaultBorderColor: Color(0xFF93D2F3),
        hasTextBorderColor: Color(0xFF93D2F3),
        highlightPinBoxColor: Color(0xFF93D2F3),
        maxLength: 6,
        onTextChanged: (text) {},
        onDone: (text) {},
        pinBoxWidth: 48,
        pinBoxHeight: 48,
        hasUnderline: false,
        pinBoxOuterPadding: EdgeInsets.only(right: 10),
        wrapAlignment: WrapAlignment.spaceAround,
        pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
        pinTextStyle: TextStyle(fontSize: 22.0),
        pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
        pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
        highlightAnimationBeginColor:Color(0xFF93D2F3),
        highlightAnimationEndColor: Color(0xFF93D2F3),
        keyboardType: TextInputType.number,
      );
}
