import 'package:intl/intl.dart';

double luasSegitiga(int alas, int tinggi) {
  final result = (alas * tinggi) / 2;
  return result;
}

String formatRupiah(double? amount) {
  final formatter = NumberFormat.currency(
    locale: 'id_ID', 
    symbol: 'Rp ', 
    decimalDigits: 0
  );
  
  if((amount ?? 0) >= 0) {
    final formatted = formatter.format(amount ?? 0);
    return formatted;
  } else {
    final formatted = formatter.format(-(amount ?? 0));
    return "($formatted)";
  }
}