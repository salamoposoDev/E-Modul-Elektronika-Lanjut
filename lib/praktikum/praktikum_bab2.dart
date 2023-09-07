import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module_elektronika/video_player_widget.dart';

class PraktikumBab2 extends StatelessWidget {
  const PraktikumBab2({super.key});

  final String step = '''
1. Dari tutorial diatas implementasikan hal yang sama pada tipe data penyimpanan Integer, Boolean, dan Float
2. Gunakan alamat eprom secara sesuai agar tidak saling menipah data satu sama lain.
3. Tulislahdatadengantypedatayangberbedapadaalamatepromyangsudah di deklarasi
4. Setelah selesai menuis data baca kembali data dan tampilkan pada Serial Monitor
5. Buatlah Laporan Analisis Penelitian dengan kriteria berikut
a. Laproan berisikan sampul dan memuat biodata
b. Laporan menjeleaskan apa yang dilakukan
c. Laporan harus memberikan informasi untuk data yang di input serta
data yang berhasil dibaca
d. Laporan harus memberikan alasan mengepa ukuran memory yang dipakai demikian, dan pengalamantan memory dengan urutan yang sedemikian pula 
''';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Implementasi Unit Penyimpanan EPROM',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Link Tutorial :',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            height: 1.8,
          ),
        ),
        SizedBox(height: 8.h),
        VideoPlayerScreen(
            videoUrl: 'https://www.youtube.com/watch?v=7ZaotSPjaZU'),
        SizedBox(height: 16.h),
        Text(
          step,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            height: 1.8,
          ),
        ),
      ],
    );
  }
}
