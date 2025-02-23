import 'package:flutter_batch_4_project/blocs/order/order_state.dart';
import 'package:flutter_batch_4_project/data/remote_data/sales_remote_data.dart';
import 'package:flutter_batch_4_project/models/order_model.dart';
import 'package:flutter_batch_4_project/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderState> {

  late final SalesRemoteData salesRemoteData;

  OrderCubit(this.salesRemoteData) : super(const OrderState());

  void _addProduct(Product product) {
    final orderItem = OrderItem(
      productId: product.id,
      quantity: 1,
      pricePerItem: product.price,
      product: product
    );

    if(state.order == null) {
      final newOrder = OrderModel(
        items: [orderItem]
      );
      emit(state.copyWith(order: newOrder));
    } else {
      final updatedItems = List<OrderItem>.from(state.order?.items ?? [])..add(orderItem);
      final updatedOrder = state.order!.copyWith(items: updatedItems);
      emit(state.copyWith(order: updatedOrder));
    }
  }

  void updateQtyProduct(Product product, int qty) {
    final isProductExist = state.order?.isProductExist(product.id!) ?? false;
    
    if(!isProductExist) {
      _addProduct(product);
    } else {
      if(qty > 0) {
        final item = state.order?.itemByProductId(product.id!)?.copyWith(
          quantity: qty
        );
        if(item != null) {
          final index = state.order?.items?.indexWhere((e) => e.productId == product.id) ?? -1;
          final newList = [...state.order?.items ?? <OrderItem>[]];
          newList[index] = item;
          final newOrder = state.order?.copyWith(
            items: newList
          );
          emit(state.copyWith(
            order: newOrder
          ));
        }
      } else {
        final newList = [...state.order?.items ?? <OrderItem>[]];
          newList.removeWhere((e) => e.productId == product.id);
          final newOrder = state.order?.copyWith(
            items: newList
          );
          emit(state.copyWith(
            order: newOrder
          ));
      }
    }
  }

  Future<void> createInvoice({
    required int paymentAmount,
    required String paymentMethod,
  }) async {
    emit(state.copyWith(status: CreateInvoiceStatus.loading));
    try {
      final order = OrderModel(
        items: state.order?.items,
        paymentAmount: paymentAmount,
        paymentMethod: paymentMethod,
      );

      await salesRemoteData.postCreateSales(order);
      emit(state.copyWith(status: CreateInvoiceStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: CreateInvoiceStatus.failed,
      ));
    }
  }

}