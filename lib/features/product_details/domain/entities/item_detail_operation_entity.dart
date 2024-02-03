import 'package:equatable/equatable.dart';

class ItemDetailOperationEntity extends Equatable {
  ItemDetailOperationEntity({
    required this.status,
    required this.message,
    this.usersCartId,
    this.itemCartId,
  }) {
    usersCartId ?? "none";
    itemCartId ?? "none";
  }

  final String status;
  final String message;
  final String? usersCartId;
  final String? itemCartId;

  @override
  // TODO: implement props
  List<Object?> get props => [status, message, usersCartId, itemCartId];
}
