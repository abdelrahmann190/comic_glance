import 'package:comic_glance/core/consts/app_strings.dart';
import 'package:comic_glance/core/di/getit_di.dart';
import 'package:comic_glance/core/helpers/extensions.dart';
import 'package:comic_glance/core/theming/text_style.dart';
import 'package:comic_glance/features/bottom_navigation/ui/widgets/custom_animated_bottom_nav_bar_icon.dart';
import 'package:comic_glance/features/comic_book_pages/logic/cubit/comic_books_cubit.dart';
import 'package:comic_glance/features/comic_book_pages/ui/pages/home_page.dart';
import 'package:comic_glance/features/settings/ui/pages/settings_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarMainPage extends StatefulWidget {
  const BottomNavigationBarMainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigationBarMainPage> createState() =>
      _BottomNavigationBarMainPageState();
}

class _BottomNavigationBarMainPageState
    extends State<BottomNavigationBarMainPage> {
  int _selectedIndex = 0;

  final List<Widget> _scaffoldBodyWidgetsList = [
    BlocProvider(
      create: (context) => getItInstance<ComicBooksCubit>(),
      child: const HomePage(),
    ),
    Container(),
    Container(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _scaffoldBodyWidgetsList,
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: context.appTheme.dividerColor,
          ),
        ),
      ),
      child: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyles.font13DynamicMedium,
        selectedItemColor: context.appTheme.primaryColor,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: List.generate(
          4,
          (index) => BottomNavigationBarItem(
            label: AppStrings.bottomNavBarItemsLabels[index],
            icon: CustomAnimatedBottomNavBarIcon(
              isPressed: _selectedIndex == index ? true : false,
              pressedIconPath:
                  AppStrings.bottomNavBarPressedIconsSVGAssets[index],
              unPressedIconPath:
                  AppStrings.bottomNavBarUnpressedIconsSVGAssets[index],
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    HapticFeedback.lightImpact();

    setState(
      () {
        _selectedIndex = index;
      },
    );
  }
}
