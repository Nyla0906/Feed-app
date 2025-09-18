import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Color backgroundColor;
  final double elevation;
  final double scrolledUnderElevation;
  final SystemUiOverlayStyle systemOverlayStyle;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? centreTitle;
  final double? leadingWidth;

  const CustomAppBar({
    super.key,
    this.title,
    this.centreTitle = false,
    this.backgroundColor = Colors.white,
    this.elevation = 0.0,
    this.scrolledUnderElevation = 0.0,
    this.systemOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    this.actions,
    this.leading,
    this.leadingWidth,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centreTitle,
      title: title,
      backgroundColor: backgroundColor,
      elevation: elevation,
      leadingWidth: leadingWidth,
      scrolledUnderElevation: scrolledUnderElevation,
      systemOverlayStyle: systemOverlayStyle,
      actions: actions,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
