import 'package:flutter/material.dart';
import 'package:moneytracka_test/apis/login_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:moneytracka_test/app_themes/app_text.dart';
import 'package:moneytracka_test/app_themes/app_colors.dart';
import 'package:moneytracka_test/screen/app_ui/register.dart';
import 'package:moneytracka_test/screen/widgets/text_field.dart';
import 'package:moneytracka_test/screen/controller/app_inputs.dart';
import 'package:moneytracka_test/screen/widgets/logo_animation.dart';
import 'package:moneytracka_test/screen/controller/app_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                          child: Text("Login",
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
                          SizedBox(
                            height: 5.h,
                          ),
                          const LoginButton(),
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
                                        const Register(),
                                  ),
                                ),
                                child: Text.rich(TextSpan(
                                    style: AppTextStyle.regular().copyWith(
                                        color: AppColors.textGrayColor),
                                    text: 'I dont have an Account?',
                                    children: [
                                      TextSpan(
                                          text: ' Register',
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
            textInput: loginUserName,
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

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Enter Password",
              style: AppTextStyle.bold().copyWith(fontSize: 14)),
          TextInput(
            keyboardType: TextInputType.text,
            hintText: 'Password',
            textInput: loginPassword,
            isVisible: isPasswordVisible,
            onPressed: () => setState(() {
              isPasswordVisible = !isPasswordVisible;
            }),
            inputIcon: Icon(
                isPasswordVisible ? Icons.visibility_off : Icons.visibility),
            onChange: (value) {},
            maxLineNumber: 1,
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      );
    });
  }
}

// button for registration
class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      CheckPassword.refProvider = ref;

      return Container(
        width: 100.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.sp),
            color: AppColors.orangeColor),
        child: TextButton(
          onPressed: () {
            LoginApi.loginApi(context);         
          },
          child: Text('Login',
              style: AppTextStyle.bold()
                  .copyWith(fontSize: 17, color: AppColors.appColor)),
        ),
      );
    });
  }
}
