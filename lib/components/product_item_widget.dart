import 'package:flutter/material.dart';
import 'package:flutter_batch_4_project/helpers/helper.dart';
import 'package:flutter_batch_4_project/models/order_model.dart';

import '../models/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  final Product product;
  final OrderModel? order;
  final Function(Product, int)? onUpdateQty;
  
  const ProductItemWidget({
    super.key,
    required this.product,
    this.order,
    this.onUpdateQty
  });

  @override
  Widget build(BuildContext context) {
    final qty = order?.itemByProductId(product.id!)?.quantity ?? 0;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    formatRupiah(product.price),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 8,
              children: [
                Text(
                  'STOK: ${product.stock}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                IntrinsicHeight(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                      )
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: qty > 0 
                              ? () => onUpdateQty?.call(product, qty-1) 
                              : null, 
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: const Icon(Icons.remove),
                          )
                        ),
                        VerticalDivider(),
                        SizedBox(
                          width: 40,
                          child: Text(
                            "$qty",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        VerticalDivider(),
                        GestureDetector(
                          onTap: () => onUpdateQty?.call(product, qty+1) , 
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: const Icon(Icons.add),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}