import 'package:mini_ecommerce/features/orders/domain/repositories/base_order_repository.dart';

class GetOrdersUseCase {
  final BaseOrderRepository baseOrderRepository;

  GetOrdersUseCase({required this.baseOrderRepository});
  call({required String where}) async =>
      await baseOrderRepository.getOrders(where: where);
}
