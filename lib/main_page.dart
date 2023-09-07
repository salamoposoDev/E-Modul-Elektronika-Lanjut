import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module_elektronika/detail_screen.dart';
import 'package:module_elektronika/models/bab_models.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.blueGrey,
      //   title: Text('Modul Rangkaian Elektronika Lanjut'),
      // ),
      body: Stack(
        children: [
          Container(
              height: screenHeight,
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('lib/images/header.png'),
                  Image.asset('lib/images/footer.png'),
                ],
              )),
          // Positioned(
          //   bottom: 0,
          //   child: Image.asset('lib/images/foother.jpeg'),
          // ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_rounded,
                              size: 35.h,
                              color: Colors.blue.shade900,
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Selamat datang',
                                  style: GoogleFonts.roboto(fontSize: 18),
                                ),
                                Text(
                                  'Sherina',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Image.asset(
                          'lib/images/logo_jtik3.png',
                          scale: 15.h,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                      thickness: 1.h,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Modul Rangkaian Elektronika Lanjut',
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.blueGrey.shade800,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    ListView.builder(
                        itemCount: babList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: BabCard(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                          bab: babList[index].bab))),
                              bab: babList[index].bab,
                              description: babList[index].description,
                              title: babList[index].title,
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BabCard extends StatelessWidget {
  const BabCard({
    super.key,
    required this.bab,
    required this.description,
    required this.title,
    this.onTap,
  });
  final String bab;
  final String description;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(2, 2),
              blurRadius: 2,
            )
          ]),
      child: Stack(
        children: [
          // Positioned(
          //   right: 0,
          //   child: Image.asset(
          //     'lib/images/logo_ft.png',
          //     scale: 20,
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bab,
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  // Image.asset(
                  //   'lib/icons/memory.png',
                  //   scale: 12.h,
                  //   color: Colors.blue.shade800,
                  // ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                title,
                style: GoogleFonts.roboto(fontSize: 14.sp),
              ),
              SizedBox(height: 4.h),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Colors.grey.shade700,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.h),
              InkWell(
                onTap: onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Selengkapnya',
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp, color: Colors.blue),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                      size: 16.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
