import 'package:flutter/material.dart';
import 'package:flutter_batch_4_project/blocs/order/order_cubit.dart';
import 'package:flutter_batch_4_project/blocs/order/order_state.dart';
import 'package:flutter_batch_4_project/blocs/product/product_cubit.dart';
import 'package:flutter_batch_4_project/blocs/product/product_state.dart';
import 'package:flutter_batch_4_project/components/product_item_widget.dart';
import 'package:flutter_batch_4_project/consts/routes.dart';
import 'package:flutter_batch_4_project/helpers/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PosTab extends StatefulWidget {
  const PosTab({super.key});

  @override
  State<PosTab> createState() => _PosTabState();
}

class _PosTabState extends State<PosTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk'),
      ),
      body: Stack(
        children: [
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if(state.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              return RefreshIndicator(
                onRefresh: context.read<ProductCubit>().loadData,
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: 200
                  ),
                  itemCount: state.products?.length ?? 0,
                  separatorBuilder: (context, index) => const SizedBox(height: 12), 
                  itemBuilder: (context, index) => BlocBuilder<OrderCubit, OrderState>(
                    builder: (context, orderState) {
                      return ProductItemWidget(
                        product: state.products![index],
                        order: orderState.order,
                        onUpdateQty: context.read<OrderCubit>().updateQtyProduct,
                      );
                    }
                  ), 
                ),
              );
            }
          ),
          _buildOrderSummary(context),
        ],
      ),
    );
  }

  Widget _buildOrderSummary(BuildContext context) {
    return Positioned(
      left: 16,
      bottom: 16,
      right: 16,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.orderSummaryScreen);
        },
        child: Card(
          elevation: 2,
          color: Theme.of(context).colorScheme.primary,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${state.order?.items?.length ?? 0} Produk dipilih',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary
                          ),
                        ),
                        Text(
                          formatRupiah(state.order?.totalPrice),
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}