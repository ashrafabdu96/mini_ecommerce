import 'package:mini_ecommerce/features/user_profile/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.status,
    required super.message,
    super.userId,
    super.userEmail,
    super.userName,
    super.userPhone,
    super.imageUrl,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      status: json["status"],
      message: json["message"] ?? "",
      userId: json["userId"].toString(),
      userName: json["userName"],
      userEmail: json["userEmail"],
      userPhone: json["userPhone"],
      imageUrl: json["imageUrl"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "userName": userName,
      "userEmail": userEmail,
      "userPhone": userPhone,
      "userId": userId,
      "imageUrl": imageUrl
    };
  }
}
