import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module_elektronika/praktikum/step_praktek.dart';
import 'package:module_elektronika/video_player_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PraktikumBab7 extends StatelessWidget {
  PraktikumBab7({super.key});

  final List<Map<String, dynamic>> step = [
    {
      'title': '1. Komponen yang diperlukan di Proteus:',
      'step': '''
1. Sumbertegangan(misalnya,Vcc=5V)
2. Resistor(misalnya,R1=1kΩ)
3. Transistor (misalnya, NPN transistor seperti 2N3904)
4. LED
5. ResistoruntukLED(misalnya,R2=220Ω)
6. Ground (GND)
''',
    },
    {
      'title': '2. Spesifikasi',
      'step': '''
1. Vcc (Tegangan suplai) = 5V
2. R1 = 1kΩ (resistor yang terhubung ke base transistor) Transistor = NPN transistor (misalnya, 2N3904)
3. R2 = 220Ω (resistor yang terhubung ke LED)
4. LED = LED yang diinginkan (misalnya, LED merah)
''',
    },
    {
      'title': '3. Tujuan Pembuatan:',
      'step': '''
1. Membuat rangkaian sederhana menggunakan transistor sebagai saklar untuk mengendalikan LED.
2. Menggambarkan prinsip kerja transistor sebagai saklar dalam rangkaian elektronik.
3. Memahami bagaimana mengatur arus basis transistor untuk mengontrol aliran arus melalui beban (LED).
''',
    },
    {
      'title': '4. Hasil yang diharapkan:',
      'step': '''
Ketika arus basis transistor diberikan (dengan menghubungkan terminal basis
transistor ke ground melalui resistor R1), transistor akan mengalirkan arus.
''',
    },
  ];

  final Uri _url = Uri.parse(
      'https://getintopc.com/softwares/electrical-engineering/proteus-professional-2022-free-download/?id=000835479650');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      const ScaffoldMessenger(
          child: SnackBar(content: Text('Gagal Membuka link')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'A. Simulasi Rangkain Sederhana',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Simulasi kali ini menimplementasikan SPICE (Simulation Program with Integrated Circuit Emphasis). Ada berbagai macam aplikasi SPICE dalam praktik kali ini kita akan menggunakan proteus. Tutorial berupa vidio yang dapat di akses melalui Youtube. Ikut langkah-langkah berikut dengan selesai dan seksama.',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            height: 1.8,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          '1. Cara install proteus :',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
            onPressed: _launchUrl,
            child: Text(
              'Download Proteus ->',
              style: GoogleFonts.poppins(
                  fontSize: 12.sp, height: 1.8, color: Colors.blue),
            )),
        const VideoPlayerScreen(
            videoUrl: 'https://www.youtube.com/watch?v=bW2lm3PfCXk'),
        SizedBox(height: 16.h),
        Text(
          '2. Simulasi Rangkaian Di proteus :',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const VideoPlayerScreen(
            videoUrl: 'https://www.youtube.com/watch?v=L1XmhCMYWKA'),
        SizedBox(height: 8.h),
        Text(
          'Setelah mengikuti langkah diatas berarti kite telah mensimulasikan rangkaian dalam bentuk skematik menggunakan SPICE proteus.',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'B. Tugas',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Rangkaian Sederhana dengan Transistor sebagai Saklar',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 8.h),
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
