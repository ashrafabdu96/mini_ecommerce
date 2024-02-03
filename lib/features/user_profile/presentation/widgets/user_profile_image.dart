import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/widgets/profile_image_picker.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    Key? key,
    required this.height,
    required this.width,
    this.imageUrl,
  }) : super(key: key);

  final double height;
  final double width;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.kShapesColor,
      backgroundImage: getImageFromNetworkOrAssets(imageUrl),
      onBackgroundImageError: (exception, stackTrace) => Icon(
        Icons.person,
        size: width * 0.2,
        color: AppColors.white,
      ),
      radius: width * 0.2,
      child: IconButton(
        icon: Icon(
          Icons.camera_alt_outlined,
          size: width * 0.08,
          shadows: AppColors.containersShadow,
        ),
        color: AppColors.white,
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (c) => const ProfileImagePicker());
        },
      ),
    );
  }
}

getImageFromNetworkOrAssets(String? imageUrl) {
  if (imageUrl != null) {}
  return imageUrl != null
      ? NetworkImage("${ApiLinks.kLinkUserImages}/${imageUrl.toString()}")
      : const AssetImage("assets/images/user_image.jpg");
}
