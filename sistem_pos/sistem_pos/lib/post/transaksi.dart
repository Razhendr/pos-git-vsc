import 'produk.dart';
import 'kasir.dart';

class Transaksi {
  DateTime tanggal;
  List<Produk> items;
  double total;
  Kasir kasir;

  Transaksi(this.tanggal, this.items, this.total, this.kasir);

  void cetakStruk() {
    print('\n--- STRUK BELANJA ---');
    print('Kasir: ${kasir.nama}');
    print('Tanggal: $tanggal');
    for (var item in items) {
      item.tampilkanInfo();
    }
    print('Total: Rp$total');
    print('---------------------');
  }
}
