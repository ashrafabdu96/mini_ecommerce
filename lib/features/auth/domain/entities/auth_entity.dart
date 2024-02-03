import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String status;
  final String message;
  final String? userName;
  final String? userEmail;
  final String? userId;
  final String? userPhone;
  String? imageUrl;

  AuthEntity({
    required this.status,
    required this.message,
    this.imageUrl,
    this.userId,
    this.userName,
    this.userEmail,
    this.userPhone,
  }) {
    userPhone ?? "none";
    userId ?? "none";
    userName ?? "none";
    userEmail ?? "none";
    imageUrl ?? "none";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        message,
        userEmail,
        userName,
        userId,
        imageUrl,
        userPhone,
      ];
}
