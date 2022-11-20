import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/app_configuration.dart';
import 'package:skybase/core/localization/locale_helper.dart';
import 'package:skybase/core/themes/app_style.dart';
import 'package:skybase/core/themes/theme_manager.dart';
import 'package:skybase/ui/views/setting/setting_controller.dart';
import 'package:skybase/ui/widgets/common_widget.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';
import 'package:skybase/ui/widgets/sky_button.dart';
import 'package:skybase/ui/widgets/sky_icon_button.dart';

class SettingView extends GetView<SettingController> {
  static const String route = '/setting';

  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(),
      bottomNavigationBar: ContentWrapper(
        bottom: true,
        child: Text(
          '${AppConfiguration.appName} - ${'txt_version'.tr} ${AppConfiguration.appVersion}',
          style: AppStyle.body2,
          textAlign: TextAlign.center,
        ),
      ),
      body: ContentWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'txt_setting'.tr,
              style: AppStyle.subtitle1.copyWith(
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'txt_dark_mode'.tr,
                  style: AppStyle.subtitle4.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GetX<ThemeManager>(
                  builder: (controller) => Switch(
                    value: controller.isDark.isTrue,
                    onChanged: (value) {
                      controller.changeTheme();
                    },
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'txt_change_language'.tr,
                  style: AppStyle.subtitle4.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SkyIconButton(
                  wrapContent: true,
                  padding: const EdgeInsets.all(8),
                  onPressed: () => LocaleHelper().showLocaleDialog(context),
                  icon: CupertinoIcons.arrow_2_circlepath,
                  iconSize: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
