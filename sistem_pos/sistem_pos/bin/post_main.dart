import 'dart:io';
import '../lib/post/produk.dart';
import '../lib/post/keranjang.dart';
import '../lib/post/kasir.dart';

void main() {
  var kasir = Kasir('Gochikara');
  var keranjang = Keranjang();
  var produk1 = Produk('Cheki', 30000, 100);
  var produk2 = Produk('Postcard', 25000, 40);
  var produk3 = Produk('Photocard', 20000, 20);
  var produk4 = Produk('Poster', 35000, 20);

  while (true) {
    print('\n=== SISTEM POST ===');
    print('1. Tambah produk ke keranjang');
    print('2. Hapus produk dari keranjang');
    print('3. Lihat keranjang');
    print('4. Checkout');
    print('5. Lihat laporan penjualan');
    print('6. Keluar');
    stdout.write('Pilih menu: ');
    var pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        print('\nDaftar Produk:');
        produk1.tampilkanInfo();
        produk2.tampilkanInfo();
        produk3.tampilkanInfo();
        produk4.tampilkanInfo();
        stdout.write('Pilih produk (1-4): ');
        var pilihProduk = stdin.readLineSync();
        if (pilihProduk == '1') {
          keranjang.tambahProduk(produk1);
        } else if (pilihProduk == '2') {
          keranjang.tambahProduk(produk2);
        } else if (pilihProduk == '3') {
          keranjang.tambahProduk(produk3);
        } else if (pilihProduk == '4') {
          keranjang.tambahProduk(produk3);
        } else {
          print('Pilihan tidak valid.');
        }
        break;

      case '2':
        keranjang.cetakKeranjang();
        stdout.write('Masukkan nama produk yang ingin dihapus: ');
        var namaProduk = stdin.readLineSync();

        var produkDitemukan = false;

        for (var produk in keranjang.daftarProduk) {
          if (produk.nama == namaProduk) {
            keranjang.hapusProduk(produk);
            produkDitemukan = true;
            break;
          }
        }

        if (!produkDitemukan) {
          print('Produk tidak ditemukan di keranjang.');
        }
        break;

      case '3':
        keranjang.cetakKeranjang();
        break;

      case '4':
        kasir.buatTransaksi(keranjang);
        break;

      case '5':
        kasir.laporanPenjualan();
        break;

      case '6':
        return;

      default:
        print('Pilihan tidak valid.');
    }
  }
}
