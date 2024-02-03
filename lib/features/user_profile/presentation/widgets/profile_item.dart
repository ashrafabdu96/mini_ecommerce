import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {Key? key,
      required this.height,
      this.width,
      required this.icon,
      required this.title,
      this.widget,
      this.onTap})
      : super(key: key);
  final double height;
  final double? width;
  final IconData icon;
  final String title;
  final Widget? widget;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height:  * 0.07,
      height: height,
      child: Card(
        child: ListTile(
          onTap: onTap,
          leading: Icon(
            icon,
            color: AppColors.kShapesColor,
          ),
          title: Text(title),
          trailing: widget,
        ),
      ),
    );
  }
}
