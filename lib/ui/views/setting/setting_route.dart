import 'package:get/get.dart';
import 'package:skybase/ui/views/setting/setting_binding.dart';
import 'package:skybase/ui/views/setting/setting_view.dart';

final settingRoute = [
  GetPage(
    name: SettingView.route,
    page: () => const SettingView(),
    binding: SettingBinding(),
  ),
];
