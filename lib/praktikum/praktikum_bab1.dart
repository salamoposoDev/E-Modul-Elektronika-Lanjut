import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module_elektronika/video_player_widget.dart';

class PraktikumBab1 extends StatefulWidget {
  const PraktikumBab1({super.key});

  @override
  State<PraktikumBab1> createState() => _PraktikumBab1State();
}

class _PraktikumBab1State extends State<PraktikumBab1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fungsi Transistor sebagai saklar',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Pahami konsep transistor sebagai saklar dan penguat lalu implementasikan dalam bentuk prorotyping pada whiteboard. Untuk lebih mendalami konsep transistor sebagai saklar liahatlah video berikut :',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            height: 1.8,
          ),
        ),
        VideoPlayerScreen(
            videoUrl: 'https://www.youtube.com/watch?v=EhoKGQ0plv0,'),
        SizedBox(height: 16.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. ',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
              ),
            ),
            Expanded(
              child: Text(
                'Sunsun rangkaian sederhana mengikuti skema pada gambar diatas pada whiteboard',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2. ',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
              ),
            ),
            Text(
              'Gunakan VCC dari sumber DC sebesar 5V',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '3. ',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
              ),
            ),
            Expanded(
              child: Text(
                'Atur potensiometer agar bernilai minimum sehingga VSG = 0',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '4. ',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
              ),
            ),
            Text(
              'CatatNilaiawalVDS=0',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '5. ',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
              ),
            ),
            Text(
              'Naikan tegangan VSG secara perlahan dari 0 -5V',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '6. ',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
              ),
            ),
            Expanded(
              child: Text(
                'Amati dan ukur menggunakan multimeter lalu Catat tegangan yang pada kaki gate source dan drain source',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '7. ',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
              ),
            ),
            Expanded(
              child: Text(
                'Analisa dan jelaskan bagaiamana hubungan tegangan input VSG terhadap output VDS !',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '8. ',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
              ),
            ),
            Expanded(
              child: Text(
                'elaskan pada tegangan berapa rangkaian bekerja sebagai transisi saklar ada pada kondisi on atau off! Apakah rangakaian tersebut ideal atau tidak?',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
