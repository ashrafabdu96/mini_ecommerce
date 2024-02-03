import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';

class ChooseImageListTile extends StatelessWidget {
  const ChooseImageListTile(
      {Key? key, required this.title, this.onTap, this.icon})
      : super(key: key);
  final String title;
  final void Function()? onTap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title.tr(context)),
      trailing: Icon(
        icon,
        color: AppColors.kShapesColor,
      ),
    );
  }
}
