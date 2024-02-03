import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/user_profile/domain/entities/user_entity.dart';

abstract class BaseProfileRepository {
  Future<UserEntity> getUserInformation();
  Future<Either<Failure, UserEntity>> getUserImage({required int userId});
  Future<Either<Failure, Map<String, dynamic>>> changeProfileImage(
      {required XFile? imageFilePath,
      required ImagePicker picker,
      required bool isGallery});
}
