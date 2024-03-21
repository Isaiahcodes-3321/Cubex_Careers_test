import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:moneytracka_test/app_themes/app_text.dart';
import 'package:moneytracka_test/app_themes/app_colors.dart';

// widget to accept input from user
class TextInput extends StatelessWidget {
  final bool isVisible;
  final Icon inputIcon;
  final TextEditingController textInput;
  final String hintText;
  final VoidCallback? onPressed;
  final void Function(String)? onChange;
  final TextInputType keyboardType;
  const TextInput(
      {Key? key,
      required this.isVisible,
      required this.inputIcon,
      required this.textInput,
      required this.hintText,
      this.onPressed,
      required this.keyboardType,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textInput,
      obscureText: isVisible,
      keyboardType: keyboardType,
      style: AppTextStyle.bold()
          .copyWith(color: AppColors.blackColor, fontSize: 16.sp),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.grayColor,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(width: 4.sp, color: AppColors.blackColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: inputIcon,
        ),
      ),
      onChanged: onChange,
    );
  }
}
