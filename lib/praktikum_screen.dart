import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module_elektronika/praktikum/praktikum_bab1.dart';
import 'package:module_elektronika/praktikum/praktikum_bab2.dart';
import 'package:module_elektronika/praktikum/praktikum_bab3.dart';
import 'package:module_elektronika/praktikum/praktikum_bab4.dart';
import 'package:module_elektronika/praktikum/praktikum_bab5.dart';
import 'package:module_elektronika/praktikum/praktikum_bab6.dart';
import 'package:module_elektronika/praktikum/praktikum_bab7.dart';
import 'package:module_elektronika/video_player_widget.dart';

class PraktikumScreen extends StatelessWidget {
  const PraktikumScreen({super.key, required this.bab});
  final String bab;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: Text(
          'PRAKTIKUM $bab',
          style: GoogleFonts.roboto(fontSize: 18.sp),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('lib/images/header.png'),
                  Image.asset('lib/images/footer.png'),
                ],
              )),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.h),
              child: praktikum(bab),
            ),
          ),
        ],
      ),
    );
  }
}

Widget praktikum(String bab) {
  Widget widget = Column();
  switch (bab) {
    case 'BAB 1':
      return widget = PraktikumBab1();
    case 'BAB 2':
      return widget = PraktikumBab2();
    case 'BAB 3':
      return widget = PraktikumBab3();
    case 'BAB 4':
      return widget = PraktikumBab4();
    case 'BAB 5':
      return widget = PraktikumBab5();
    case 'BAB 6':
      return widget = PraktikumBab6();
    case 'BAB 7':
      return widget = PraktikumBab7();
    default:
  }
  return widget;
}
