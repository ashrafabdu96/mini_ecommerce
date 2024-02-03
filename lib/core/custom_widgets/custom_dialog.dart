import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';

showDialogMessage({
  required BuildContext context,
  void Function()? onPressedYes,
}) {
  showDialog(
      barrierDismissible: false,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          title: Row(
            children: [
              Text("Are you sure".tr(context)),
              const Icon(
                Icons.question_mark,
                color: AppColors.kShapesColor,
              ),
            ],
          ),
          content: Text("you want to buy these products".tr(context)),
          actions: [
            MaterialButton(
              onPressed: onPressedYes,
              child: Text(
                'Yes'.tr(context),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.kShapesColor,
                    ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel'.tr(context),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.kShapesColor,
                    ),
              ),
            ),
          ],
        );
      });
}
