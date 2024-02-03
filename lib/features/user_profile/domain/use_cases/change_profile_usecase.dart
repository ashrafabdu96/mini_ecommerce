import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/user_profile/domain/repositories/base_profile_repository.dart';

class ChangeProfileImageUseCase {
  final BaseProfileRepository baseProfileRepository;

  ChangeProfileImageUseCase({required this.baseProfileRepository});
  Future<Either<Failure, Map<String, dynamic>>> call(
      {required XFile? imageFilePath,
      required ImagePicker picker,
      required bool isGallery}) async {
    return await baseProfileRepository.changeProfileImage(
        imageFilePath: imageFilePath, picker: picker, isGallery: isGallery);
  }
}
