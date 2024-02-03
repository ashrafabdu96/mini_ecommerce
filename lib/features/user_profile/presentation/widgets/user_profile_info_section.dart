import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/cubit/profile_cubit.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/widgets/user_info_widget.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/widgets/user_profile_image.dart';

class UserProfileInfoSection extends StatelessWidget {
  const UserProfileInfoSection({Key? key, required this.size})
      : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      // bloc: sl<ProfileCubit>(),
      builder: (context, state) {
        if (state is ProfileSuccessState) {
          return Column(
            children: [
              UserProfileImage(
                height: size.height * 0.2,
                width: size.width,
                imageUrl: state.userEntity.imageUrl,
              ),
              UserInfoWidget(
                height: size.height * 0.04,
                fontSize: size.width * 0.04,
                title: state.userEntity.userName.toString(),
              ),
              UserInfoWidget(
                height: size.height * 0.023,
                fontSize: size.width * 0.028,
                title: state.userEntity.userPhone.toString(),
              ),
              UserInfoWidget(
                height: size.height * 0.025,
                fontSize: size.width * 0.028,
                title: state.userEntity.userEmail.toString(),
              ),
            ],
          );
        } else {
          return CircleAvatar(
            radius: size.width * 0.2,
          );
        }
      },
    );
  }
}
