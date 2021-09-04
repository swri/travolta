import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travolta/controller.dart';

import 'package:travolta/show.dart';

class HomePage extends GetView<Travolta> {
  final nama = TextEditingController();
  final waktuKerja = TextEditingController();
  final pengeluaran = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Get.defaultDialog(
          radius: 16,
          title: 'Keluar',
          titlePadding: const EdgeInsets.only(
            top: 30,
          ),
          titleStyle: TextStyle(
            fontFamily: 'Balsamiq',
            color: Colors.black87,
            fontSize: 24,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          content: Text(
            'Yakin anda ingin keluar dari aplikasi?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Balsamiq',
              color: Colors.black87,
              fontSize: 21,
            ),
          ),
          onCancel: () => Get.back(result: false),
          textCancel: 'Batal',
          onConfirm: () => Get.back(result: true),
          textConfirm: 'Oke',
          confirmTextColor: Colors.white,
        );
      },
      child: Scaffold(
        backgroundColor: Colors.cyan,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.cyan,
                  Colors.cyanAccent,
                  Colors.tealAccent,
                  Colors.teal,
                ],
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Kalkulator\n            Travolta',
                          style: TextStyle(
                            fontFamily: 'Merriweather',
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 6,
                                color: Colors.blue,
                              ),
                            ],
                            color: Colors.blueAccent,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      teksBox(teks: 'Masukan nama', ikon: Icons.person),
                      teksField(
                        controller: nama,
                        inputAksi: TextInputAction.next,
                        type: TextInputType.name,
                      ),
                      const SizedBox(height: 30),
                      teksBox(
                          teks: 'Waktu Kerja per minggu (jam)',
                          ikon: Icons.timer),
                      teksField(
                        controller: waktuKerja,
                        inputAksi: TextInputAction.next,
                        type: TextInputType.number,
                        panjang: 3,
                      ),
                      const SizedBox(height: 30),
                      teksBox(
                          teks: 'Pengeluaran (Rp)', ikon: Icons.attach_money),
                      teksField(
                        controller: pengeluaran,
                        inputAksi: TextInputAction.done,
                        type: TextInputType.number,
                        prefixTeks: 'Rp. ',
                      ),
                      const SizedBox(height: 80),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          controller.hitung(
                            nama.text,
                            double.tryParse(waktuKerja.text) ?? 0,
                            double.tryParse(pengeluaran.text) ?? 0,
                          );

                          Get.to(
                            ShowPage(),
                            arguments: [
                              nama.text,
                              controller.pendapatan,
                              controller.status,
                              controller.tabungan,
                            ],
                          );
                          nama.clear();
                          waktuKerja.clear();
                          pengeluaran.clear();
                        },
                        child: Container(
                          height: 60,
                          child: Center(
                            child: Text(
                              'Calculate',
                              style: TextStyle(
                                fontFamily: 'Balsamiq',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField teksField({
    required TextEditingController controller,
    required TextInputAction inputAksi,
    required TextInputType type,
    int? panjang,
    String? prefixTeks,
  }) {
    return TextField(
      controller: controller,
      keyboardType: type,
      style: TextStyle(
        fontFamily: 'Balsamiq',
        color: Colors.blue[400],
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      maxLines: 1,
      maxLength: panjang,
      textAlignVertical: TextAlignVertical.top,
      textInputAction: inputAksi,
      decoration: InputDecoration(
        counterText: '',
        filled: true,
        fillColor: Colors.grey[100],
        prefixText: prefixTeks,
        prefixStyle: TextStyle(
          fontFamily: 'Balsamiq',
          color: Colors.blue[400],
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.blue.withOpacity(0.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.blue.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Padding teksBox({required String teks, required IconData ikon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            teks,
            style: TextStyle(
              fontFamily: 'Balsamiq',
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Spacer(),
          Icon(
            ikon,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
