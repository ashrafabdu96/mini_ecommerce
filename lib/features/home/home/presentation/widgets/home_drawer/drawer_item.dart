import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key, this.onTap, required this.title, required this.icon})
      : super(key: key);
  final void Function()? onTap;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      style: ListTileStyle.drawer,
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: BorderSide(
          color: AppColors.grey,
          width: 1,
        ),
      ),
      onTap: onTap,
      title: Text(title),
      leading: Icon(
        icon,
        color: AppColors.kShapesColor,
      ),
    );
  }
}
