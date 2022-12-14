import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/ui/views/intro/intro_view.dart';
import 'package:skybase/ui/views/login/login_view.dart';
import 'package:skybase/ui/views/main_navigation/main_nav_controller.dart';
import 'package:skybase/ui/views/sample_feature/list/sample_feature_list_view.dart';
import 'package:skybase/ui/views/utils/utils_view.dart';
import 'package:skybase/ui/widgets/common_widget.dart';
import 'package:skybase/ui/widgets/colored_status_bar.dart';

class MainNavView extends GetView<MainNavController> {
  static const String route = '/main-nav';
  const MainNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredStatusBar(
        child: SafeArea(
          child: DoubleBack(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (index) => controller.index.value = index,
              children: const [
                SampleFeatureListView(),
                IntroView(),
                LoginView(),
                UtilsView(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        ()=> BottomNavigationBar(
          currentIndex: controller.index.value,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            controller.pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Users',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book),
              label: 'Intro',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.arrow_right_to_line),
              label: 'Login',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Utility',
            ),
          ],
        ),
      ),
    );
  }
}
