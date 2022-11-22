import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/app_configuration.dart';
import 'package:skybase/core/themes/app_style.dart';
import 'package:skybase/ui/views/restaurant/detail/restaurant_detail_controller.dart';
import 'package:skybase/ui/widgets/base/sky_view.dart';
import 'package:skybase/ui/widgets/common_widget.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';
import 'package:skybase/ui/widgets/sky_card.dart';
import 'package:skybase/ui/widgets/sky_image.dart';

class RestaurantDetailView extends GetView<RestaurantDetailController> {
  static const String route = '/restaurant-detail';

  const RestaurantDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: controller.restaurant.value?.name),
      body: SafeArea(
        child: Obx(
          ()=> SkyView(
            loadingEnabled: controller.isLoading.isTrue,
            errorEnabled: controller.isError.isTrue,
            onRetry: () => controller.loadData(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkyImage(
                  url: '${AppConfiguration.developmentAPI}'
                      '/images/medium/'
                      '${controller.restaurant.value?.pictureId}',
                  height: 300,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                const SizedBox(height: 16),
                ContentWrapper(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${controller.restaurant.value?.name}',
                            style: AppStyle.subtitle2,
                          ),
                          Row(
                            children: [
                              const SkyImage(
                                url: 'assets/images/ic_star.svg',
                                height: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${controller.restaurant.value?.rating}',
                                style: AppStyle.headline4,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const SkyImage(
                            url: 'assets/images/ic_location.png',
                            height: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${controller.restaurant.value?.city}',
                            style: AppStyle.body1
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Row(
                            children: [
                              const SkyImage(
                                url: 'assets/images/ic_food.png',
                                height: 36,
                              ),
                              const SizedBox(width: 8),
                              Obx(
                                () => Text(
                                  '${controller.restaurant.value?.menus?.drinks?.length} '
                                  '${'txt_foods'.tr}',
                                  style: AppStyle.body1
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              const SkyImage(
                                url: 'assets/images/ic_drink.png',
                                height: 36,
                              ),
                              const SizedBox(width: 8),
                              Obx(
                                () => Text(
                                  '${controller.restaurant.value?.menus?.drinks?.length} '
                                  '${'txt_drinks'.tr}',
                                  style: AppStyle.body1
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Obx(
                        () => Text(
                          '${controller.restaurant.value?.description}',
                          textAlign: TextAlign.justify,
                          style: AppStyle.body1.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ContentWrapper(
                  child: Text(
                    'txt_menu'.tr,
                    textAlign: TextAlign.justify,
                    style: AppStyle.subtitle3,
                  ),
                ),
                const SizedBox(height: 8),
                ContentWrapper(
                  child: Text(
                    'txt_drink'.tr,
                    textAlign: TextAlign.justify,
                    style: AppStyle.subtitle4.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 4,
                  ),
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => Row(
                      children: List.generate(
                        controller.restaurant.value?.menus?.drinks?.length ?? 0,
                        (index) {
                          final item =
                              controller.restaurant.value?.menus?.drinks?[index];
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: SkyCard(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              borderRadius: 8,
                              child: Center(child: Text('${item?.name}')),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ContentWrapper(
                  child: Text(
                    'txt_food'.tr,
                    textAlign: TextAlign.justify,
                    style: AppStyle.subtitle4.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 4,
                  ),
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => Row(
                      children: List.generate(
                        controller.restaurant.value?.menus?.drinks?.length ?? 0,
                        (index) {
                          final item =
                              controller.restaurant.value?.menus?.drinks?[index];
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: SkyCard(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              borderRadius: 8,
                              child: Center(child: Text('${item?.name}')),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
