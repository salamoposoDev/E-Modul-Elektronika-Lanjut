import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module_elektronika/praktikum/step_praktek.dart';
import 'package:module_elektronika/video_player_widget.dart';

class PraktikumBab5 extends StatelessWidget {
  PraktikumBab5({super.key});

  final List<Map<String, dynamic>> step = [
    {
      'title': 'A. Alat dan Bahan',
      'step': '''
1. Breadboard
2. IC(IntegratedCircuit)Op-Amp
3. Resistor
4. Kapasitor
5. SumberteganganDC
6. Sumber sinyal analog (misalnya, potensiometer)
7. ADC (Analog-to-Digital Converter) IC (misalnya, ADC0804)
8. DAC (Digital-to-Analog Converter) IC (misalnya, DAC0808)
9. Mikrokontroler(opsional)
10. Kabelpenghubung
''',
    },
    {
      'title': 'B. Persiapan',
      'step': '''
1. Siapkan breadboard dan pastikan itu dalam kondisi yang baik.
2. Siapkan IC Op-Amp, resistor, dan kapasitor yang dibutuhkan.
3. Siapkan ADC dan DAC IC yang akan digunakan.
4. Siapkan sumber tegangan DC dan sumber sinyal analog.
''',
    },
    {
      'title': 'C. RangkaianKonverterD/A:',
      'step': '''
1. Rancang rangkaian konverter D/A dengan menggunakan DAC IC.
2. Pasang DAC IC pada breadboard dengan benar.
3. Sambungkan input digital ke DAC IC sesuai dengan desain.
4. Sambungkan output analog dari DAC IC ke resistor dan op-amp untuk
menghasilkan tegangan output yang sesuai.
''',
    },
    {
      'title': 'D. RangkaianKonverterA/D:',
      'step': '''
1. Rancang rangkaian konverter A/D dengan menggunakan ADC IC.
2. Pasang ADC IC pada breadboard dengan benar.
3. Sambungkan sumber sinyal analog (misalnya, potensiometer) ke input
analog ADC IC.
4. Sambungkan output digital dari ADC IC ke mikrokontroler atau
tampilkan langsung pada LED atau seven-segment display (jika
tersedia).
''',
    },
    {
      'title': 'E. Pengujian:',
      'step': '''
1. Nyalakan sumber tegangan DC.
2. Atur potensiometer (sumber sinyal analog) untuk menghasilkan
berbagai level tegangan analog.
3. Perhatikan nilai digital yang dihasilkan oleh konverter A/D dan
tegangan analog yang dihasilkan oleh konverter D/A.
4 Verifikasi keakuratan konversi A/D dan D/A dengan membandingkan
nilai analog input dengan nilai digital dan nilai analog output dengan
nilai yang diharapkan.
''',
    },
    {
      'title': 'F. Analisis:',
      'step': '''
1. Bandingkan nilai analog input dengan nilai digital yang dihasilkan oleh konverter A/D.
2. Evaluasi keakuratan konversi A/D dan D/A berdasarkan karakteristik konverter yang telah dipelajari.
3. Diskusikan aplikasi dan manfaat dari konverter A/D dan D/A dalam sistem elektronika.
''',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ADC dan DAC pada op AMP',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Pahami konsep ADC dan DAC pada op AMP untuk dapat memulai praktik. Lihatlah video penjelasan konsep yang disajikan melalui link berikut :',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            height: 1.8,
          ),
        ),
        SizedBox(height: 16.h),
        const VideoPlayerScreen(
            videoUrl:
                'https://www.youtube.com/watch?v=n2aC9hWKYig&pp=ugMICgJpZBABGAH'),
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
