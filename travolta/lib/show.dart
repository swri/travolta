import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:travolta/home.dart';

class ShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.blue[400],
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.tealAccent,
                  Colors.cyan,
                  Colors.lightBlue,
                ],
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Lottie.asset('assets/profile.json'),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.blue.withOpacity(0.2),
                            Colors.amber.withOpacity(0.1),
                          ],
                        ),
                      ),
                      width: MediaQuery.of(context).size.width - 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: RichText(
                        text: TextSpan(
                          text: 'Nama anda:\n   ${data[0]}',
                          style: TextStyle(
                            fontFamily: 'Balsamiq',
                            fontSize: 28,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.blue.withOpacity(0.2),
                            Colors.amber.withOpacity(0.1),
                          ],
                        ),
                      ),
                      width: MediaQuery.of(context).size.width - 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Balsamiq',
                            fontSize: 28,
                            color: Colors.blueAccent,
                          ),
                          children: [
                            TextSpan(
                              text: 'Pendapatan anda:\n   ',
                            ),
                            TextSpan(
                              text: NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp.',
                                decimalDigits: 0,
                              ).format(data[1]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.blue.withOpacity(0.2),
                            Colors.amber.withOpacity(0.1),
                          ],
                        ),
                      ),
                      width: MediaQuery.of(context).size.width - 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Balsamiq',
                            fontSize: 28,
                            color: Colors.blueAccent,
                          ),
                          children: [
                            TextSpan(text: '${data[2]}\n'),
                            (data[2] == 'Bisa menabung!')
                                ? TextSpan(
                                    text: 'Jumlah yang bisa ditabung adalah ',
                                  )
                                : (data[2] == 'Cari Tambahan!')
                                    ? TextSpan(text: 'Perlu ')
                                    : TextSpan(),
                            (data[2] == 'Bisa menabung!' ||
                                    data[2] == 'Cari Tambahan!')
                                ? TextSpan(
                                    text: NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp.',
                                      decimalDigits: 0,
                                    ).format(data[3].abs()),
                                  )
                                : TextSpan(),
                            (data[2] == 'Cari Tambahan!')
                                ? TextSpan(
                                    text: ' lagi untuk memenuhi kebutuhan')
                                : TextSpan(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Get.offAll(HomePage()),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Container(
                          child: Text(
                            'Kembali',
                            style: TextStyle(
                              fontFamily: 'Balsamiq',
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
