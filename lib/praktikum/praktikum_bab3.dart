import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module_elektronika/praktikum/step_praktek.dart';
import 'package:module_elektronika/video_player_widget.dart';

class PraktikumBab3 extends StatelessWidget {
  const PraktikumBab3({super.key});

  final String alatDanBahan = '''
1. Breadboard
2. IC (Integrated Circuit) keluarga logika (misalnya, IC 7400, IC 7408)
3. Resistor
4. LED
5. Kabelpenghubung
''';

  final String persiapan = '''
1. Siapkan breadboard dan pastikan itu dalam kondisi yang baik.
2. Siapkan IC keluarga logika yang akan digunakan.
3. Siapkan resistor dan LED.
      ''';

  final String interfacing = '''
1. Sambungkan kaki positif LED ke resistor, kemudian sambungkan resistor ke sumber tegangan (misalnya, VCC).
2. Sambungkan kaki negatif LED ke pin output IC keluarga logika yang ingin diuji.
3. Hubungkan pin GND IC keluarga logika ke sumber tegangan ground (misalnya, GND).
''';

  final String desainLogika = '''
1. Rancang logika sederhana dengan menggunakan gerbang logika (misalnya, AND, OR) pada IC keluarga logika yang dipilih.
2. Tentukan input yang diperlukan untuk menghasilkan output yang diinginkan.
''';

  final String implementasi = '''
1. Pasang IC keluarga logika pada breadboard dengan benar.
2. Sambungkan kabel penghubung dari sumber tegangan (VCC dan GND) ke
breadboard.
3. Sambungkan kabel penghubung dari sumber tegangan input ke pin input IC
keluarga logika sesuai dengan desain logika yang telah dirancang.
4. Sambungkan kabel penghubung dari pin output IC keluarga logika yang diuji
ke kaki positif LED.
''';

  final String pengujian = '''
1. Nyalakan sumber tegangan.
2. Berikan input yang sesuai untuk menguji logika yang telah dirancang.
3. Perhatikan apakah LED menyala sesuai dengan logika yang diharapkan.
''';

  final String analisis = '''
1. Perhatikan hasil yang diperoleh dan bandingkan dengan desain logika yang telah dirancang.
2. Evaluasi apakah interfacing antara keluarga logika dan LED berjalan dengan baik.
''';

  final String catatan =
      'Praktikum ini hanya mencakup konsep dasar teknik antarmuka keluarga logika. Anda dapat mengembangkan praktikum ini dengan menambahkan lebih banyak gerbang logika, menghubungkan beberapa IC keluarga logika, atau menggunakan perangkat tambahan lainnya untuk menggali lebih dalam tentang teknik antarmuka keluarga logika.';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Traffic Light Circuit',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Pada praktikum ini kita akan coba mengiplementasikan model interfacing pada keluarga logika dasar. Berikut ini adalah contoh video praktukum yang akan dilakukan:',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            height: 1.8,
          ),
        ),
        SizedBox(height: 16.h),
        const VideoPlayerScreen(
            videoUrl: 'https://www.youtube.com/watch?v=TRoyQcF8a40'),
        SizedBox(height: 16.h),
        StepPraktek(
          title: 'A. Alat dan Bahan:',
          step: alatDanBahan,
        ),
        StepPraktek(
          title: 'B. Persiapan:',
          step: persiapan,
        ),
        StepPraktek(
          title: 'C. Interfacing dengan LED:',
          step: interfacing,
        ),
        StepPraktek(
          title: 'D. Desain Logika:',
          step: desainLogika,
        ),
        StepPraktek(
          title: 'E. Implementasi:',
          step: implementasi,
        ),
        StepPraktek(
          title: 'F. Pengujian:',
          step: pengujian,
        ),
        StepPraktek(
          title: 'G. Analisis:',
          step: analisis,
        ),
        StepPraktek(
          title: 'Catatan:',
          step: catatan,
        ),
      ],
    );
  }
}
