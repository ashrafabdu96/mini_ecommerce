import 'package:mini_ecommerce/features/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel(
      {required super.status,
      required super.message,
      super.userEmail,
      super.userName,
      super.userId,
      super.userPhone,
      super.imageUrl}) {
    userPhone ?? "none";
    userId ?? "none";
    userName ?? "none";
    userEmail ?? "none";
  }
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    // if(json.containsKey('data'))
    if (json.containsKey('data')) {
      return AuthModel(
        status: json["status"],
        message: json["message"],
        userEmail: json["data"]["users_email"] ?? "none",
        userId: json["data"]["users_id"] == null
            ? "none"
            : json["data"]["users_id"].toString(),
        userName: json["data"]["users_name"] ?? "none",
        userPhone: json["data"]["users_phone"] ?? "none",
        imageUrl: json["data"]["users_image"] ?? "none",
      );
    } else {
      return AuthModel(status: json["status"], message: json["message"] ?? '');
    }
  }
  factory AuthModel.fromLocalJson(Map<String, dynamic> json) {
    // if(json.containsKey('data'))
    return AuthModel(
        status: json["status"],
        message: json["message"],
        userEmail: json["userEmail"] ?? "none",
        userId: json["userId"].toString(),
        userName: json["userName"] ?? "none",
        userPhone: json["userPhone"] ?? "none",
        imageUrl: json["imageUrl"] ?? "none");
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
