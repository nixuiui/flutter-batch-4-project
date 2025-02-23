import 'package:flutter/material.dart';
import 'package:flutter_batch_4_project/helpers/helper.dart';
import 'package:flutter_batch_4_project/models/order_model.dart';

class ProductItemSummaryWidget extends StatelessWidget {

  final OrderItem orderItem;

  const ProductItemSummaryWidget({
    super.key,
    required this.orderItem
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderItem.product?.name ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Qty: ${orderItem.quantity}x',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        formatRupiah(orderItem.pricePerItem),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}