import 'package:get/get.dart';

class Travolta extends GetxController {
  int gajiNormal = 15000;
  int gajiLembur = 22500;
  int jamNormal = 40;
  String status = '';
  double jamLembur = 0;
  double pendapatan = 0;
  double tabungan = 0;

  hitung(String name, double workTime, double expendit) {
    if (workTime > jamNormal) {
      jamLembur = workTime - jamNormal;
      var valueNormal = jamNormal * gajiNormal;
      var valueLembur = jamLembur * gajiLembur;
      pendapatan = valueNormal + valueLembur;
      if (pendapatan > expendit) {
        tabungan = pendapatan - expendit;
        status = 'Bisa menabung!';
      } else if (pendapatan == expendit) {
        tabungan = pendapatan - expendit;
        status = 'Tidak bisa menabung!';
      } else if (pendapatan < expendit) {
        tabungan = pendapatan - expendit;
        status = 'Cari Tambahan!';
      } else {
        status = 'Terjadi Error!';
        tabungan = 0;
      }
    } else {
      if (workTime > 0) {
        pendapatan = workTime * gajiNormal;
        if (pendapatan > expendit) {
          tabungan = pendapatan - expendit;
          status = 'Bisa menabung!';
        } else if (pendapatan == expendit) {
          tabungan = pendapatan - expendit;
          status = 'Tidak bisa menabung!';
        } else if (pendapatan < expendit) {
          tabungan = pendapatan - expendit;
          status = 'Cari Tambahan!';
        } else {
          status = 'Terjadi Error!';
          tabungan = 0;
        }
      } else {
        status = 'Kamu Tidak Bekerja';
        tabungan = 0;
        pendapatan = 0;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
