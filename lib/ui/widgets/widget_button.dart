import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.margin,
    this.padding,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        child: child,
      ),
    );
  }
}
