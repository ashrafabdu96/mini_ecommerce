import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String status;
  final String message;
  final String? userName;
  final String? userEmail;
  final String? userId;
  final String? userPhone;
  String? imageUrl;

  UserEntity({
    required this.status,
    required this.message,
    this.userId,
    this.userName,
    this.userEmail,
    this.userPhone,
    this.imageUrl,
  }) {
    userPhone ?? "none";
    userId ?? "none";
    userName ?? "none";
    userEmail ?? "none";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        message,
        userEmail,
        userName,
        userId,
        userPhone,
      ];
}
