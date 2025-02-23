import 'package:flutter/material.dart';
import 'package:flutter_batch_4_project/blocs/sales_invoice/sales_invoice_cubit.dart';
import 'package:flutter_batch_4_project/blocs/sales_invoice/sales_invoice_state.dart';
import 'package:flutter_batch_4_project/helpers/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class InvoiceTab extends StatefulWidget {
  const InvoiceTab({super.key});

  @override
  State<InvoiceTab> createState() => _InvoiceTabState();
}

class _InvoiceTabState extends State<InvoiceTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales Invoice Tab"),
      ),
      body: BlocBuilder<SalesInvoiceCubit, SalesInvoiceState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: context.read<SalesInvoiceCubit>().loadData,
            child: ListView.separated(
              padding: EdgeInsets.all(16),
              itemCount: state.salesInvoices?.length ?? 0,
              separatorBuilder: (context, indext) => const SizedBox(height: 16), 
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(
                    "INV-${state.salesInvoices![index].id}",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('EEE, dd MMMM y').format(state.salesInvoices![index].saleDate!)
                  ),
                  trailing: Text(
                    formatRupiah(state.salesInvoices![index].totalPrice),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.secondary
                    ),
                  ),
                ),
              ), 
            ),
          );
        }
      ),
    );
  }
}