import 'package:flutter_batch_4_project/helpers/extensions/list_extension.dart';
import 'package:flutter_batch_4_project/models/product_model.dart';

class OrderModel {
    final List<OrderItem>? items;
    final int? paymentAmount;
    final String? paymentMethod;

    OrderModel({
        this.items,
        this.paymentAmount,
        this.paymentMethod,
    });

    double get totalPrice => (items ?? []).fold(0, (sum, item) => (sum ?? 0) + (item.totalPrice)) ?? 0;

    bool isProductExist(int id) {
      return items?.where((e) => e.productId == id).toList().isNotEmpty ?? false;
    }

    OrderItem? itemByProductId(int id) => items?.firstWhereOrNull((e) => e.productId == id);

    Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "payment_amount": paymentAmount,
        "payment_method": paymentMethod,
    };

    OrderModel copyWith({
      List<OrderItem>? items,
      int? paymentAmount,
      String? paymentMethod,
    }) {
      return OrderModel(
        items: items ?? this.items,
        paymentAmount: paymentAmount ?? this.paymentAmount,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
    }
}


class OrderItem {
    final int? productId;
    final int? quantity;
    final double? pricePerItem;
    final Product? product;

    OrderItem({
        this.productId,
        this.quantity,
        this.pricePerItem,
        this.product,
    });

    double get totalPrice => (quantity ?? 0) * (pricePerItem ?? 0);

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "qty": quantity,
        "price_per_item": pricePerItem,
    };

    OrderItem copyWith({
      int? productId,
      int? quantity,
      double? pricePerItem,
      Product? product,
    }) {
      return OrderItem(
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        pricePerItem: pricePerItem ?? this.pricePerItem,
        product: product ?? this.product,
      );
    }
}