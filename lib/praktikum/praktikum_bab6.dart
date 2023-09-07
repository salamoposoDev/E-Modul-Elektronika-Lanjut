import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module_elektronika/praktikum/step_praktek.dart';
import 'package:module_elektronika/video_player_widget.dart';

class PraktikumBab6 extends StatelessWidget {
  PraktikumBab6({super.key});

  final List<Map<String, dynamic>> step = [
    {
      'title': 'A. Alat dan Bahan:',
      'step': '''
1. Breadboard
2. Komponen elektronik (resistor, kapasitor, transistor, dll.)
3. SumberteganganDC
4. Sumber sinyal (misalnya, fungsi generator)
5. Osziloskop atau multimeter (untuk pengukuran)
''',
    },
    {
      'title': 'B. Persiapan:',
      'step': '''
1. Siapkan breadboard dan pastikan itu dalam kondisi yang baik.
2. Siapkan komponen elektronik yang dibutuhkan sesuai dengan
desain sistem yang akan dibuat.
3. Siapkan sumber tegangan DC dan sumber sinyal yang diperlukan.
''',
    },
    {
      'title': 'C. Rangkaian Energi Switching:',
      'step': '''
1. Rancang dan bangun rangkaian energi switching menggunakan
komponen elektronik yang sesuai.
2. Pastikan memperhatikan parameter desain seperti efisiensi, waktu beralih, dan daya yang dapat disipasi.
''',
    },
    {
      'title': 'D. Pengukuran Parameter:',
      'step': '''
1. Sambungkan sumber tegangan DC dan sumber sinyal ke rangkaian
energi switching yang telah dibuat.
2. Gunakan osiloskop atau multimeter untuk mengukur parameter
desain seperti efisiensi, waktu beralih, dan disipasi daya.
3. Catat hasil pengukuran dan perhatikan bagaimana parameter
tersebut mempengaruhi kinerja sistem.
''',
    },
    {
      'title': 'E. Analisis Kebisingan dan Degradasi Sinyal:',
      'step': '''
1. Diskusikan konsep margin kebisingan dan strategi untuk mengurangi kebisingan dalam sistem.
2. Identifikasi sumber kopling dan degradasi sinyal yang dapat terjadi dalam desain sistem.
3. Diskusikan cara mengatasi kebisingan dan degradasi sinyal dengan menggunakan strategi desain yang tepat dan perangkat lunak yang sesuai.
''',
    },
    {
      'title': 'F. EfekSaluranTransmisi:',
      'step': '''
1. Pilih satu komponen dalam rangkaian dan analisis efek saluran
transmisi pada pemutusan pasif dan aktiv.
2. Diskusikan perbedaan antara pemutusan pasif dan aktiv dalam
desain sistem dan dampaknya pada kinerja sistem secara
keseluruhan.
''',
    },
    {
      'title': 'G. Kesimpulan:',
      'step': '''
1. Evaluasi hasil praktikum dan diskusikan kesimpulan mengenai pentingnya parameter rancangan dalam desain sistem.
2. Diskusikan manfaat dari menerapkan strategi desain yang tepat untuk mengatasi kebisingan dan degradasi sinyal dalam sistem.
3. Dokumentasikan dalam bentuk laporan praktikum
''',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Analisis Parameter Rancangan dalam Desain Sistem',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Praktik kali ini untuk mengimplementaiskan konsep power switching pada rangkaian sederhana. Untuk dapat memahami model rangkaian yang dibuat bisa lihat video berikut :',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            height: 1.8,
          ),
        ),
        SizedBox(height: 16.h),
        const VideoPlayerScreen(
            videoUrl: 'https://www.youtube.com/watch?v=W3Q2aWs5XS4'),
        SizedBox(height: 16.h),
        Text(
          'Langkah-langkah Praktikum :',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        ListView.builder(
          itemCount: step.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return StepPraktek(
              title: step[index]['title'],
              step: step[index]['step'],
            );
          },
        ),
      ],
    );
  }
}
