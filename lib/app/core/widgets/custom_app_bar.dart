import 'package:bs23_assess/app/core/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';

import '/app/core/values/app_colors.dart';

/// Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitleText;
  final List<Widget>? actions;
  final bool isCenterTitle;
  final bool isBackButtonEnabled;

  const CustomAppBar(
      {Key? key,
      required this.appBarTitleText,
      this.actions,
      this.isCenterTitle = true,
      this.isBackButtonEnabled = true})
      : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarColor,
      centerTitle: isCenterTitle,
      elevation: 0,
      automaticallyImplyLeading: isBackButtonEnabled,
      actions: actions,
      iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
      title: AppBarTitle(text: appBarTitleText),
    );
  }
}
