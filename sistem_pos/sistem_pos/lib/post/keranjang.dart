import 'produk.dart';

class Keranjang {
  List<Produk> daftarProduk = [];
  double total = 0.0;

  void tambahProduk(Produk produk) {
    if (produk.stok > 0) {
      daftarProduk.add(produk);
      produk.stok--;
      total += produk.harga;

      print('${produk.nama} ditambahkan ke keranjang.');
    } else {
      print('Stok ${produk.nama} habis!');
    }
  }

  void hapusProduk(Produk produk) {
    if (daftarProduk.contains(produk)) {
      daftarProduk.remove(produk);
      produk.stok++;
      total -= produk.harga;
      print('${produk.nama} dihapus dari keranjang.');
    } else {
      print('${produk.nama} tidak ada di keranjang.');
    }
  }

  void cetakKeranjang() {
    print('\nKeranjang Belanja:');
    if (daftarProduk.isEmpty) {
      print('Keranjang kosong.');
    } else {
      for (var produk in daftarProduk) {
        produk.tampilkanInfo();
      }
      print('Total: Rp$total');
    }
  }

  void kosongkanKeranjang() {
    for (var produk in daftarProduk) {
      produk.stok++;
    }
    daftarProduk.clear();
    total = 0.0;
  }
}
