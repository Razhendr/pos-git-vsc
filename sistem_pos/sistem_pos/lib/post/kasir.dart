import 'transaksi.dart';
import 'keranjang.dart';

class Kasir {
  String nama;
  List<Transaksi> daftarTransaksi = [];

  Kasir(this.nama);

  void buatTransaksi(Keranjang keranjang) {
    if (keranjang.daftarProduk.isEmpty) {
      print('Keranjang kosong. Tidak dapat membuat transaksi.');
      return;
    }

    var transaksi = Transaksi(DateTime.now(), List.from(keranjang.daftarProduk),
        keranjang.total, this);
        
    daftarTransaksi.add(transaksi);
    transaksi.cetakStruk();
    keranjang.kosongkanKeranjang();
  }

  void laporanPenjualan() {
    print('\n--- LAPORAN PENJUALAN ---');
    if (daftarTransaksi.isEmpty) {
      print('Belum ada transaksi.');
    } else {
      for (var transaksi in daftarTransaksi) {
        print('Tanggal: ${transaksi.tanggal}, Total: Rp${transaksi.total}');
      }
    }
  }
}
