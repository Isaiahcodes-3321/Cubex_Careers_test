import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:moneytracka_test/apis/register_api.dart';
import 'package:moneytracka_test/provider/provider.dart';
import 'package:moneytracka_test/app_themes/app_text.dart';
import 'package:moneytracka_test/screen/app_ui/login.dart';
import 'package:moneytracka_test/app_themes/app_colors.dart';
import 'package:moneytracka_test/screen/widgets/text_field.dart';
import 'package:moneytracka_test/screen/controller/app_inputs.dart';
import 'package:moneytracka_test/screen/widgets/logo_animation.dart';
import 'package:moneytracka_test/screen/controller/app_controller.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: AppColors.appColor,
        height: 100.h,
        width: 100.w,
        child: Padding(
          padding: EdgeInsets.only(top: 3.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                  child: Column(
                    children: [
                      SizedBox(
                          width: 100.w,
                          height: 15.h,
                          child: const LogoAnimation()),
                      SizedBox(
                        height: 1.h,
                      ),
                      FittedBox(
                          child: Text("Create Account",
                              style:
                                  AppTextStyle.bold().copyWith(fontSize: 23))),
                      SizedBox(
                        height: 1.h,
                      ),
                      FittedBox(
                          child: Text("Enter your details",
                              style: AppTextStyle.regular()
                                  .copyWith(fontSize: 16))),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 63.h,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 219, 219, 219),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 4.h),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          userInputs(),
                          SizedBox(
                            height: 3.h,
                          ),
                          userInputs2(context),
                          SizedBox(
                            height: 5.h,
                          ),
                          const RegisterB(),
                          SizedBox(
                            height: 3.h,
                          ),
                          SizedBox(
                            width: 100.w,
                            child: Center(
                              child: GestureDetector(
                                onTap: () => Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const Login(),
                                  ),
                                ),
                                child: Text.rich(TextSpan(
                                    style: AppTextStyle.regular().copyWith(
                                        color: AppColors.textGrayColor),
                                    text: 'I already have an Account?',
                                    children: [
                                      TextSpan(
                                          text: ' Log in',
                                          style: AppTextStyle.bold())
                                    ])),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
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
            textInput: registerUserName,
            isVisible: false,
            onPressed: () {},
            inputIcon: const Icon(null),
            maxLineNumber: 1,
          ),
          SizedBox(
            height: 2.h,
          ),
          const PasswordInputs(),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }

  // container to display the rest static user inputs
  Widget userInputs2(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Email", style: AppTextStyle.bold().copyWith(fontSize: 14)),
          TextInput(
            keyboardType: TextInputType.emailAddress,
            hintText: 'isaiahshell2019@gmail.com',
            textInput: registerEmail,
            isVisible: false,
            onPressed: () {},
            inputIcon: const Icon(null),
            maxLineNumber: 1,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text("Number", style: AppTextStyle.bold().copyWith(fontSize: 14)),
          TextInput(
            keyboardType: TextInputType.number,
            hintText: '7013128342',
            textInput: registerPhoneNumber,
            isVisible: false,
            onPressed: () {},
            inputIcon: const Icon(null),
            maxLineNumber: 1,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text("Address", style: AppTextStyle.bold().copyWith(fontSize: 14)),
          TextInput(
            keyboardType: TextInputType.text,
            hintText: 'No Street, City, Country',
            textInput: registerAddress,
            isVisible: false,
            onPressed: () {},
            inputIcon: const Icon(null),
            maxLineNumber: 3,
          ),
          SizedBox(
            height: 2.h,
          ),
          GestureDetector(
              onTap: () {
               ImageSelector.showImagePickerOptions(context);
              },
              child: Text(
                "Select Image",
                style: AppTextStyle.bold().copyWith(
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  decorationThickness: 4, 
                ),
              )),
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
      final passwordHaveUppercase = ref.watch(uppercasePassword);
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
            textInput: registerPassword,
            isVisible: isPasswordVisible,
            onPressed: () => setState(() {
              isPasswordVisible = !isPasswordVisible;
            }),
            inputIcon: Icon(
                isPasswordVisible ? Icons.visibility_off : Icons.visibility),
            onChange: (value) {
              setState(() {
                ref.read(passwordChecker.notifier).state =
                    registerPassword.text;
                CheckPassword.checkPasswordStrength();
              });
            },
            maxLineNumber: 1,
          ),
          SizedBox(
            height: 2.h,
          ),
          passwordInformation(
              passwordHaveUppercase
                  ? AppColors.greenColor
                  : AppColors.grayColor,
              'UpperCase'),
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

// button for registration
class RegisterB extends StatefulWidget {
  const RegisterB({super.key});

  @override
  State<RegisterB> createState() => _RegisterBState();
}

class _RegisterBState extends State<RegisterB> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      CheckPassword.refProvider = ref;
      bool makeButtonVisible = false;

      if (CheckPassword.refProvider.watch(uppercasePassword) &&
          CheckPassword.refProvider.watch(passwordEightCharacters) &&
          CheckPassword.refProvider.watch(passwordContainsSymbols)) {
        makeButtonVisible = true;
      }
      return Container(
        width: 100.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.sp),
            color: makeButtonVisible
                ? AppColors.orangeColor
                : const Color.fromARGB(255, 226, 219, 207)),
        child: TextButton(
          onPressed: () {
            RegisterApi.registerApi(context);
          },
          child: Text('Register',
              style: AppTextStyle.bold()
                  .copyWith(fontSize: 17, color: AppColors.appColor)),
        ),
      );
    });
  }
}
