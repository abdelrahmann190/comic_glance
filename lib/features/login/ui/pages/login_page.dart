import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25.h),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/batman_bg.jpg'),
            opacity: 0.5,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 70.w,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: context.appTheme.canvasColor.withOpacity(0.7),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
