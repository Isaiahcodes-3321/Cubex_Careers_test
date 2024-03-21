import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:moneytracka_test/screen/app_ui/login_view.dart';

//code entry point
void main() => runApp(const MyApp());

// root widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const ProviderScope(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home:  LoginView(),
          ),
        );
      },
    );
  }
}
