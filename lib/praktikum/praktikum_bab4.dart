import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module_elektronika/praktikum/step_praktek.dart';
import 'package:module_elektronika/video_player_widget.dart';

class PraktikumBab4 extends StatelessWidget {
  PraktikumBab4({super.key});

  final List<Map<String, dynamic>> step = [
    {
      'title': 'A. Alat dan Bahan',
      'step': '''
1. Breadboard
2. IC (Integrated Circuit) OP-AMP (misalnya, IC LM741) Resistor
3 .Kapasitor
4 .Sumber tegangan DC
5 .Multimeter (untuk pengukuran)
''',
    },
    {
      'title': 'B. Persiapan',
      'step': '''
1. Siapkan breadboard dan pastikan itu dalam kondisi yang baik.
2. Siapkan IC OP-AMP yang akan digunakan (misalnya, LM741).
3. Siapkanresistordankapasitordengannilaiyangsesuai.
''',
    },
    {
      'title': 'C. Rangkaian Inverting',
      'step': '''
1. Rancang rangkaian inverting dengan menggunakan IC OP-AMP.
2. Pasang IC OP-AMP pada breadboard dengan benar.
3. Sambungkan resistor input dan umpanbalik sesuai dengan desain rangkaian
inverting.
4. Sambungkan resistor output dan resistor umpanbalik ke ground.
5. HubungkansumberteganganDCkerangkaian.
''',
    },
    {
      'title': 'D. Rangkaian Non-Inverting',
      'step': '''
1. Rancang rangkaian non-inverting dengan menggunakan IC OP-AMP.
2. Pasang IC OP-AMP pada breadboard dengan benar.
3. Sambungkan resistor input dan resistor umpanbalik sesuai dengan desain
rangkaian non-inverting.
4. Sambungkan resistor output ke ground.
5. HubungkansumberteganganDCkerangkaian.
''',
    },
    {
      'title': 'E. Pengukuran',
      'step': '''
1. NyalakansumberteganganDC.
2. Gunakanmultimeteruntukmengukurteganganinputdanoutputpadakedua
rangkaian (inverting dan non-inverting).
3. Catat hasil pengukuran dan perhatikan perbedaan antara tegangan input dan output.
''',
    },
    {
      'title': 'F. Analisis',
      'step': '''
1. Perhatikan hasil pengukuran dan bandingkan dengan perhitungan teoritis yang sesuai.
2. Evaluasi kinerja rangkaian inverting dan non-inverting berdasarkan karakteristik OP-AMP yang telah dipelajari.
3. Diskusikan perbedaan antara rangkaian inverting dan non-inverting, serta manfaat dan penerapannya dalam aplikasi elektronika.
''',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rangkaian OP-AMP Dasar',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Tujuan praktikum ini yaitu memahami definisi, karakteristik dasar, dan penerapan OP-AMP dalam rangkaian elektronika. Lihatlah Vidio Penejelasan untuk memahami langkah dalam praktik kali ini',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            height: 1.8,
          ),
        ),
        SizedBox(height: 16.h),
        const VideoPlayerScreen(
            videoUrl: 'https://www.youtube.com/watch?v=PqyMVZo8nX4'),
        SizedBox(height: 16.h),
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
        Text(
          'Catatan',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Praktikum ini hanya mencakup konsep dasar tentang OP-AMP dan penerapannya dalam rangkaian inverting dan non-inverting. Anda dapat mengembangkan praktikum ini dengan menambahkan lebih banyak jenis rangkaian OP-AMP, seperti rangkaian penjumlah, differensial, integrator, dan filter low pass, serta mempelajari karakteristik non-ideal OP-AMP dan multistage rangkaian OP-AMP',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
          ),
          textAlign: TextAlign.justify,
        )
      ],
    );
  }
}
