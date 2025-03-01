import 'package:flutter_batch_4_project/helpers/helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Format Rupiah', () {
    test('Mengembalikan format rupiah dengan nilai positif', () {
      final result = formatRupiah(100000);
      expect(result, "Rp 100.000");
    });

    test("Mengembalikan Rp 0, jikan input null", () {
      final result = formatRupiah(null);
      expect(result, "Rp 0");
    });

    test("Mengembalikan Rp 0, jikan input 0", () {
      final result = formatRupiah(0);
      expect(result, "Rp 0");
    });

    test("Mengembalikan (Rp 100.000), jikan input -100000", () {
      final result = formatRupiah(-100000);
      expect(result, "(Rp 100.000)");
    });
  });

}