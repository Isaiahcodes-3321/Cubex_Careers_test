import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:moneytracka_test/provider/provider.dart';
import 'package:moneytracka_test/app_themes/app_text.dart';
import 'package:moneytracka_test/app_themes/app_colors.dart';
import 'package:moneytracka_test/screen/widgets/text_field.dart';
import 'package:moneytracka_test/screen/controller/app_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: AppColors.appColor,
        height: 100.h,
        width: 100.w,
        child: Padding(
          padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 3.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.w,
                  height: 15.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FlutterLogo(
                        size: 40,
                      ),
                      Text.rich(TextSpan(
                          style:
                              AppTextStyle.regular().copyWith(fontSize: 23.sp),
                          text: 'Monie',
                          children: [
                            TextSpan(
                                text: 'Tracka',
                                style: AppTextStyle.bold()
                                    .copyWith(fontSize: 23.sp))
                          ])),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                FittedBox(
                    child: Text("Create Account",
                        style: AppTextStyle.bold().copyWith(fontSize: 23))),
                SizedBox(
                  height: 1.h,
                ),
                FittedBox(
                    child: Text("Enter your details",
                        style: AppTextStyle.regular().copyWith(fontSize: 16))),
                SizedBox(
                  height: 3.h,
                ),
                userInputs(),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  width: 100.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w),
                    child: Text.rich(TextSpan(
                        style: AppTextStyle.regular()
                            .copyWith(fontSize: 15)
                            .copyWith(color: AppColors.textGrayColor),
                        text: 'By signing up, I have read and agreed to the',
                        children: [
                          TextSpan(
                              text: ' Terms and conditions, Use policy',
                              style:
                                  AppTextStyle.bold().copyWith(fontSize: 15)),
                          TextSpan(
                              text: ' and',
                              style: AppTextStyle.regular().copyWith(
                                  color: AppColors.textGrayColor,
                                  fontSize: 15)),
                          TextSpan(
                              text: ' Privacy policy.',
                              style: AppTextStyle.bold().copyWith(fontSize: 15))
                        ])),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.sp),
                      color: AppColors.orangeColor),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Login',
                        style: AppTextStyle.bold()
                            .copyWith(fontSize: 17, color: AppColors.appColor)),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  width: 100.w,
                  child: Center(
                    child: Text.rich(TextSpan(
                        style: AppTextStyle.regular()
                            .copyWith(color: AppColors.textGrayColor),
                        text: 'I already have an Account?',
                        children: [
                          TextSpan(text: ' Log in', style: AppTextStyle.bold())
                        ])),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  // container to display static user inputs
  Widget userInputs() {
    return SizedBox(
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Username", style: AppTextStyle.bold().copyWith(fontSize: 14)),
          TextInput(
            keyboardType: TextInputType.text,
            hintText: 'Username',
            textInput: TextEditingController(),
            isVisible: false,
            onPressed: () {},
            inputIcon: const Icon(null),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text("Phone Number",
              style: AppTextStyle.bold().copyWith(fontSize: 14)),
          TextInput(
            keyboardType: TextInputType.number,
            hintText: 'Phone Number',
            textInput: TextEditingController(),
            isVisible: false,
            onPressed: () {},
            inputIcon: const Icon(null),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text("Email", style: AppTextStyle.bold().copyWith(fontSize: 14)),
          TextInput(
            keyboardType: TextInputType.emailAddress,
            hintText: 'Email',
            textInput: TextEditingController(),
            isVisible: false,
            onPressed: () {},
            inputIcon: const Icon(null),
          ),
          SizedBox(
            height: 2.h,
          ),
          const PasswordInputs(),
          SizedBox(
            height: 2.h,
          ),
          Text("Confirm Password",
              style: AppTextStyle.bold().copyWith(fontSize: 14)),
          TextInput(
            keyboardType: TextInputType.text,
            hintText: 'Confirm Password',
            textInput: TextEditingController(),
            isVisible: false,
            onPressed: () {},
            inputIcon: const Icon(null),
          ),
        ],
      ),
    );
  }
}

// input for password
class PasswordInputs extends StatefulWidget {
  const PasswordInputs({super.key});
  @override
  State<PasswordInputs> createState() => _PasswordInputsState();
}

class _PasswordInputsState extends State<PasswordInputs> {
  bool isPasswordVisible = false;

  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      CheckPassword.refProvider = ref;
      // get the user password values from provider
      final isPasswordWeak = ref.watch(passwordWeak);
      final isPasswordEightCharacters = ref.watch(passwordEightCharacters);
      final isPasswordContainsSymbols = ref.watch(passwordContainsSymbols);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Enter Password",
              style: AppTextStyle.bold().copyWith(fontSize: 14)),
          TextInput(
            keyboardType: TextInputType.text,
            hintText: 'Password',
            textInput: password,
            isVisible: isPasswordVisible,
            onPressed: () => setState(() {
              isPasswordVisible = !isPasswordVisible;
            }),
            inputIcon: Icon(
                isPasswordVisible ? Icons.visibility_off : Icons.visibility),
            onChange: (value) {
              setState(() {
                ref.read(passwordChecker.notifier).state = password.text;
                CheckPassword.checkPasswordStrength();
              });
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          passwordInformation(
              isPasswordWeak ? AppColors.greenColor : AppColors.grayColor,
              'Weak'),
          passwordInformation(
              isPasswordEightCharacters
                  ? AppColors.greenColor
                  : AppColors.grayColor,
              'Use at least 8 character'),
          passwordInformation(
              isPasswordContainsSymbols
                  ? AppColors.greenColor
                  : AppColors.grayColor,
              'Mix letters,numbers and spacial character (e.g.@*&|)'),
        ],
      );
    });
  }

// widget to show the password information
  Widget passwordInformation(Color iconColor, String text) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: iconColor,
          size: 10,
        ),
        SizedBox(
          width: 1.w,
        ),
        FittedBox(
          child: Text(text,
              style: AppTextStyle.regular()
                  .copyWith(color: AppColors.textGrayColor, fontSize: 12)),
        ),
      ],
    );
  }
}
