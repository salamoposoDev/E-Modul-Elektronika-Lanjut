import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StepPraktek extends StatelessWidget {
  const StepPraktek({super.key, required this.title, required this.step});
  final String title;
  final String step;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.sp),
          child: Text(
            step,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
