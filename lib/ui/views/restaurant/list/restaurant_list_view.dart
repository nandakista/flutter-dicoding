import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/core/themes/app_style.dart';
import 'package:skybase/ui/views/restaurant/list/restaurant_list_controller.dart';
import 'package:skybase/ui/views/restaurant/list/widgets/restaurant_item.dart';
import 'package:skybase/ui/views/setting/setting_view.dart';
import 'package:skybase/ui/widgets/base/sky_list_view.dart';
import 'package:skybase/ui/widgets/colored_status_bar.dart';
import 'package:skybase/ui/widgets/common_widget.dart';
import 'package:skybase/ui/widgets/keyboard_dismisser.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';
import 'package:skybase/ui/widgets/sky_form_field.dart';
import 'package:skybase/ui/widgets/sky_image.dart';
import 'package:skybase/ui/widgets/widget_button.dart';

class RestaurantListView extends GetView<RestaurantListController> {
  static const String route = '/restaurant/list';

  const RestaurantListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      child: KeyboardDismisser(
        child: Scaffold(
          appBar: SkyAppBar.primary(
            actions: [
              WidgetButton(
                margin: const EdgeInsets.only(right: 24),
                onTap: () => Get.toNamed(SettingView.route),
                child: const Icon(CupertinoIcons.settings),
              ),
            ],
          ),
          body: ContentWrapper(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'txt_restaurant'.tr,
                  style: AppStyle.subtitle2,
                ),
                Text(
                  'txt_restaurant_subtitle'.tr,
                  style: AppStyle.body1,
                ),
                const SizedBox(height: 12),
                SkyFormField(
                  icon: Icons.search,
                  hint: 'txt_search_restaurant'.tr,
                  onChanged: (query) => controller.searchData(query),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Obx(
                    () => SkyListView(
                      emptyEnabled: controller.dataRestaurant.isEmpty,
                      loadingEnabled: controller.isLoading.isTrue,
                      errorEnabled: controller.isError.isTrue,
                      errorSubtitle: controller.errorMessage.value,
                      emptyImage: const SkyImage(
                        url: 'assets/images/img_not_found.png',
                      ),
                      emptyTitle: 'txt_empty_restaurant_title'.tr,
                      emptySubtitle: 'txt_empty_restaurant_subtitle'.tr,
                      onRetry: () => controller.loadData(),
                      onRefresh: () => controller.loadData(),
                      child: ListView.builder(
                        itemCount: controller.dataRestaurant.length,
                        itemBuilder: (context, index) {
                          return RestaurantItem(
                            data: controller.dataRestaurant[index],
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
