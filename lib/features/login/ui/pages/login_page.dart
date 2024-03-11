import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/widgets/custom_text_field.dart';
import 'package:comic_glance/core/widgets/main_page_header_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            width: 80.w,
            height: 60.h,
            padding: EdgeInsets.symmetric(
              horizontal: 15.px,
              vertical: 15.px,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: context.appTheme.canvasColor.withOpacity(0.8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const MainPageHeaderText(data: 'Log in'),
                Gap(30.px),
                CustomTextField(
                  hintText: 'user name',
                  icon: Icons.email,
                  controller: TextEditingController(),
                  isPasswordField: false,
                ),
                Gap(15.px),
                CustomTextField(
                  hintText: 'password',
                  icon: Icons.lock,
                  controller: TextEditingController(),
                  isPasswordField: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
