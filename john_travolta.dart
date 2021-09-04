import 'dart:io';

class Travolta {
  static const int gajiNormal = 15000;
  static const int gajiLembur = 22500;
  static const int jamNormal = 40;

  late String name;
  late double waktuKerja;
  late double jamLembur;
  late double pendapatan;
  late double pengeluaran;

  // Input data Tiga Variabel Nama, jam, dan uang pengeluaran
  void masukanData() {
    stdout.write('\nMasukan Nama Karyawan: ');
    name = stdin.readLineSync()!;
    stdout.write('Waktu Kerja Karyawan per minggu (Jam): ');
    waktuKerja = double.parse(stdin.readLineSync()!);
    stdout.write('Pengeluaran Karyawan per minggu (Rp.): ');
    pengeluaran = double.parse(stdin.readLineSync()!);
    print('');
  }

  void cetakData(String nama, double masukan, double keluaran) {
    print('====================\n');
    print('Nama Karyawan: $nama');
    print(
        'Pendapatan: Rp.${masukan.toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')}');
    print('--------------------');
    //// Cek bisa ditabung atau tidak
    if (masukan > keluaran) {
      var tabung = masukan - keluaran;
      print('Bisa menabung!');
      print(
          'Jumlah yang bisa ditabung: Rp.${tabung.toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')}');
    } else if (masukan == keluaran) {
      print('Tidak bisa menabung!');
    } else if (masukan < keluaran) {
      print('Cari Tambahan');
      print(
          'Perlu Rp.${(masukan - keluaran).abs().toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')} untuk kebutuhan');
    } else {
      print('Error input program');
    }
  }

  void inisialisasi() {
    masukanData();
    if (waktuKerja > jamNormal) {
      jamLembur = waktuKerja - jamNormal;
      var valueNormal = jamNormal * gajiNormal;
      var valueLembur = jamLembur * gajiLembur;
      pendapatan = valueNormal + valueLembur;
      // Print Nilai
      cetakData(name, pendapatan, pengeluaran);
    } else {
      if (waktuKerja > 0) {
        pendapatan = waktuKerja * gajiNormal;
        // Print Nilai
        cetakData(name, pendapatan, pengeluaran);
      } else {
        print('Kamu tidak bekerja');
      }
    }
  }
}

void main(List<String> arguments) {
  var start = Travolta();
  start.inisialisasi();
}
