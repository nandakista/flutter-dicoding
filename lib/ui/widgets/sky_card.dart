import 'package:flutter/material.dart';
import 'package:get/get.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class SkyCard extends StatelessWidget {
  final Color? borderColor, backgroundColor;
  final Widget? child;
  final double? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? padding;

  const SkyCard({
    Key? key,
    this.borderColor,
    this.backgroundColor = Colors.white,
    this.borderRadius = 12,
    this.child,
    this.padding,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: elevation ?? 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius!),
          color: (Get.isDarkMode)
              ? context.theme.dialogBackgroundColor
              : Colors.white,
        ),
        child: child,
      ),
    );
  }
}