import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skybase/core/themes/app_shadows.dart';
import 'package:skybase/core/themes/theme_manager.dart';
import 'package:skybase/ui/widgets/colored_status_bar.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    Key? key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.centerTitle = false,
    this.titleStyle,
    this.iconColor,
    this.elevation,
    this.height,
    this.iconSize,
  }) : super(key: key);

  final String? title;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Color? iconColor;
  final TextStyle? titleStyle;
  final double? elevation;
  final double? height;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeManager>(
      builder: (controller) {
        return AppBar(
          centerTitle: centerTitle,
          title: Text(
            title ?? '',
            style: titleStyle,
          ),
          backgroundColor: backgroundColor,
          elevation: elevation,
          actions: actions,
          actionsIconTheme: IconThemeData(
            color: iconColor,
            size: 24,
            shadows: [
              AppShadows.shadow3,
            ],
          ),
          iconTheme: IconThemeData(
            color: iconColor,
            size: iconSize,
            shadows: [
              AppShadows.shadow3,
            ],
          ),
          systemOverlayStyle: controller.isDark.isTrue
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
