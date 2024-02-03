import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/cubit/profile_cubit.dart';

import '../../../../core/constants/app_routes_name.dart';
import '../../../../injection_container.dart';

// class ProfileImagePicker extends StatefulWidget {
//   const ProfileImagePicker({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<ProfileImagePicker> createState() => _ProfileImagePickerState();
// }
//
// class _ProfileImagePickerState extends State<ProfileImagePicker> {
//   XFile? imageFile;
//   final ImagePicker _picker = ImagePicker();
//   late ChangImageCubit changImageCubit;
//   @override
//   void initState() {
//     changImageCubit = BlocProvider.of<ChangImageCubit>(context);
//     super.initState();
//   }
//
//   Future pickImage({required bool isGallery}) async {
//     print("pressed");
//     try {
//       final XFile? imagePicked = await _picker.pickImage(
//           source: isGallery ? ImageSource.gallery : ImageSource.camera);
//
//       setState(() {
//         imageFile = imagePicked;
//       });
//       // snd to Server
//       if (imageFile != null) {
//         var request = http.MultipartRequest(
//           'POST',
//           Uri.parse(ApiLinks.kLinkAddUserImage),
//         );
//         var imageFileRequest =
//             await http.MultipartFile.fromPath('image', imageFile!.path);
//         request.files.add(imageFileRequest);
//         Map<String, String> body = {
//           "userId": getUserId(),
//         };
//         request.fields.addAll(body);
//         var response = await request.send();
//         if (response.statusCode == 200) {
//           var responseData = await response.stream.toBytes();
//           var responseString = String.fromCharCodes(responseData);
//           final finalResponse = jsonDecode(responseString);
//           print(finalResponse);
//           // finalResponse["status"] == "success" ? setState(() {}) : null;
//         }
//       }
//     } catch (e) {
//       return false;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Padding(
//       padding: EdgeInsets.all(size.height * 0.02),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "image_profile".tr(context),
//                 style: Theme.of(context).textTheme.headline1!.copyWith(
//                       color: AppColors.kShapesColor,
//                     ),
//               ),
//               const Icon(
//                 Icons.delete,
//                 color: AppColors.kShapesColor,
//               ),
//             ],
//           ),
//           SizedBox(
//             height: size.height * 0.02,
//           ),
//           ListTile(
//             onTap: () async {
//               await pickImage(isGallery: false);
//               await BlocProvider.of<ChangImageCubit>(context).changeImage();
//             },
//             title: Text('from_camera'.tr(context)),
//             trailing: const Icon(
//               Icons.camera_alt_rounded,
//               color: AppColors.kShapesColor,
//             ),
//           ),
//           ListTile(
//             onTap: () async {
//               await pickImage(isGallery: true);
//               await BlocProvider.of<ChangImageCubit>(context).changeImage();
//             },
//             title: Text('from_gallery'.tr(context)),
//             trailing: const Icon(
//               Icons.image,
//               color: AppColors.kShapesColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ProfileImagePicker extends StatefulWidget {
  const ProfileImagePicker({
    Key? key,
    // required this.myContext
  }) : super(key: key);
  // final BuildContext myContext;

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  XFile? imageFile;

  ImagePicker picker = ImagePicker();

  Future pickImage({required bool isGallery}) async {
    print("pressed");
    try {
      final XFile? imagePicked = await picker.pickImage(
          source: isGallery ? ImageSource.gallery : ImageSource.camera);

      setState(() {
        imageFile = imagePicked;
      });

      // snd to Server
      if (imageFile != null) {
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(ApiLinks.kLinkAddUserImage),
        );
        var imageFileRequest =
            await http.MultipartFile.fromPath('image', imageFile!.path);
        request.files.add(imageFileRequest);
        Map<String, String> body = {
          "userId": getUserId(),
        };
        request.fields.addAll(body);
        var response = await request.send();
        if (response.statusCode == 200) {
          var responseData = await response.stream.toBytes();
          var responseString = String.fromCharCodes(responseData);
          final finalResponse = jsonDecode(responseString);
          print(finalResponse);
          // finalResponse["status"] == "success" ? setState(() {}) : null;
        }
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.height * 0.02),
      child: BlocProvider(
        // key: widget.uniqueKey,
        create: (context) => sl<ProfileCubit>(),
        child: Builder(builder: (context) {
          ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "image_profile".tr(context),
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: AppColors.kShapesColor,
                        ),
                  ),
                  const Icon(
                    Icons.delete,
                    color: AppColors.kShapesColor,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              ListTile(
                onTap: () {
                  pickImage(isGallery: false).then((value) async {
                    await profileCubit.getUserInfoRemotely(
                        userId: int.parse(getUserId()));
                  }).whenComplete(() {
                    Navigator.of(context).pop();
                  });
                },
                title: Text('from_camera'.tr(context)),
                trailing: const Icon(
                  Icons.camera_alt_rounded,
                  color: AppColors.kShapesColor,
                ),
              ),
              ListTile(
                onTap: () {
                  pickImage(isGallery: true).then((value) async {
                    await profileCubit.getUserInfoRemotely(
                        userId: int.parse(getUserId()));
                    // await profileCubit.changeImage();
                  }).whenComplete(() {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutesName.homeScreen,
                      arguments: getUserId(),
                      (route) => true,
                    );
                  });
                  // changeImageCubit.changeImage();
                  // changeImage(isGallery: true).whenComplete(() =>  );
                },
                title: Text('from_gallery'.tr(context)),
                trailing: const Icon(
                  Icons.image,
                  color: AppColors.kShapesColor,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
