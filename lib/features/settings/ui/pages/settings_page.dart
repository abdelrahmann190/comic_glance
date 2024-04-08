import 'package:comic_glance/core/widgets/body_header_text_bold.dart';
import 'package:comic_glance/core/widgets/body_header_text_medium.dart';
import 'package:comic_glance/core/widgets/main_page_header_text.dart';
import 'package:comic_glance/features/login/logic/login_cubit/login_cubit.dart';
import 'package:comic_glance/features/settings/ui/widgets/change_password_dialog.dart';
import 'package:comic_glance/features/settings/ui/widgets/log_out_button.dart';
import 'package:comic_glance/features/settings/ui/widgets/password_update_bloclistner.dart';
import 'package:comic_glance/features/settings/ui/widgets/profile_field_row.dart';
import 'package:comic_glance/features/settings/ui/widgets/theme_mode_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.px,
                vertical: 10.px,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MainPageHeaderText(
                      data: 'Settings',
                    ),
                    Gap(35.px),
                    const BodyHeaderText(
                      data: 'Account',
                    ),
                    Gap(25.px),
                    const BodyHeaderTextMedium(data: 'Edit username'),
                    Gap(25.px),
                    ProfileFieldRow(
                      title: 'Change password',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return ChangePasswordDialog(
                              loginCubitInstance: context.read<LoginCubit>(),
                            );
                          },
                        );
                      },
                    ),
                    Gap(25.px),
                    const BodyHeaderTextMedium(data: 'Email address'),
                    Gap(50.px),
                    const BodyHeaderText(
                      data: 'Apperance',
                    ),
                    Gap(25.px),
                    const ThemeModeSettingsCard(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10.px,
            right: 25.w,
            left: 25.w,
            child: const LogoutButton(),
          ),
          const PasswordUpdateBloclistner(),
        ],
      ),
    );
  }
}
