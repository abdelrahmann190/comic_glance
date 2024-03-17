import 'package:comic_glance/core/consts/app_strings.dart';
import 'package:comic_glance/core/di/getit_di.dart';
import 'package:comic_glance/core/helpers/app_shared_preferences.dart';
import 'package:comic_glance/core/theming/theme_controller.dart';
import 'package:comic_glance/core/widgets/body_header_text_medium.dart';
import 'package:comic_glance/features/settings/ui/widgets/radio_button_row.dart';
import 'package:comic_glance/features/settings/ui/widgets/show_settings_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ThemeModeSettingsCard extends StatefulWidget {
  const ThemeModeSettingsCard({super.key});

  @override
  State<ThemeModeSettingsCard> createState() => _ThemeModeSettingsCardState();
}

class _ThemeModeSettingsCardState extends State<ThemeModeSettingsCard> {
  final themeController = getItInstance<ThemeController>();
  late final valueNotifier = ValueNotifier(
    currentThemeMode,
  );
  final appSharedPrefereneces = getItInstance<AppSharedPrefereneces>();
  late String? currentThemeMode = appSharedPrefereneces.getAppThemeMode();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BodyHeaderTextMedium(
          data: 'Theme mode',
        ),
        ShowSettingsDialogButton(
          text: currentThemeMode ?? '',
          onTap: () async {
            await buildThemeDialog(
              context,
            );
          },
        ),
      ],
    );
  }

  Future buildThemeDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: ListView(
            padding: EdgeInsets.all(10.sp),
            shrinkWrap: true,
            children: [
              Column(
                children: List.generate(
                  AppStrings.themeModesList.length,
                  (index) => RadioButtonRow(
                    label: AppStrings.themeModesList[index],
                    valueNotifier: valueNotifier,
                    onChanged: (value) {
                      valueNotifier.value = value;
                      themeController.updateThemeMode(
                        themeMode: value ?? '',
                      );
                      setState(
                        () {
                          currentThemeMode = value;
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
