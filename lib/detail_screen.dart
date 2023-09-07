import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:module_elektronika/praktikum_screen.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.bab});
  final String bab;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PdfViewerController? _pdfViewerController;
  late PdfTextSearchResult _searchResult;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  String selectedSubBab = 'lib/pdf/bab1/bab1_a.pdf';
  bool isSearch = false;
  TextEditingController textEditingController = TextEditingController();

  final listBab = {
    'BAB 1': [
      'lib/pdf/bab1/bab1_a.pdf',
      'lib/pdf/bab1/bab1_b.pdf',
      'lib/pdf/bab1/bab1_c.pdf',
      'lib/pdf/bab1/bab1_d.pdf',
      'lib/pdf/bab1/bab1_e.pdf',
      'lib/pdf/bab1/bab1_f.pdf',
    ],
    'BAB 2': [
      'lib/pdf/bab2/bab2_a.pdf',
      'lib/pdf/bab2/bab2_b.pdf',
      'lib/pdf/bab2/bab2_c.pdf',
      'lib/pdf/bab2/bab2_d.pdf',
      'lib/pdf/bab2/bab2_e.pdf',
      'lib/pdf/bab2/bab2_f.pdf',
    ],
    'BAB 3': [
      'lib/pdf/bab3/bab3_a.pdf',
      'lib/pdf/bab3/bab3_b.pdf',
      'lib/pdf/bab3/bab3_c.pdf',
      'lib/pdf/bab3/bab3_d.pdf',
      'lib/pdf/bab3/bab3_e.pdf',
      'lib/pdf/bab3/bab3_f.pdf',
    ],
    'BAB 4': [
      'lib/pdf/bab4/bab4_a.pdf',
      'lib/pdf/bab4/bab4_b.pdf',
      'lib/pdf/bab4/bab4_c.pdf',
      'lib/pdf/bab4/bab4_d.pdf',
      'lib/pdf/bab4/bab4_e.pdf',
      'lib/pdf/bab4/bab4_f.pdf',
    ],
    'BAB 5': [
      'lib/pdf/bab5/bab5_ab.pdf',
      'lib/pdf/bab5/bab5_ab.pdf',
      'lib/pdf/bab5/bab5_c.pdf',
      'lib/pdf/bab5/bab5_d.pdf',
      'lib/pdf/bab5/bab5_e.pdf',
      'lib/pdf/bab5/bab5_f.pdf',
    ],
    'BAB 6': [
      'lib/pdf/bab6/bab6_a.pdf',
      'lib/pdf/bab6/bab6_b.pdf',
      'lib/pdf/bab6/bab6_c.pdf',
      'lib/pdf/bab6/bab6_d.pdf',
      'lib/pdf/bab6/bab6_e.pdf',
      'lib/pdf/bab6/bab6_f.pdf',
    ],
    'BAB 7': [
      'lib/pdf/bab7/bab7_a.pdf',
      'lib/pdf/bab7/bab7_b.pdf',
      'lib/pdf/bab7/bab7_c.pdf',
      'lib/pdf/bab7/bab7_d.pdf',
      'lib/pdf/bab7/bab7_e.pdf',
      'lib/pdf/bab7/bab7_f.pdf',
    ],
  };

  final subItem = [
    const PopupMenuItem(
      value: 'a',
      child: Text('Pendahuluan'),
    ),
    const PopupMenuItem(
      value: 'b',
      child: Text('Tujuan Pembelajaran'),
    ),
    const PopupMenuItem(
      value: 'c',
      child: Text('Pembahasan'),
    ),
    const PopupMenuItem(
      value: 'd',
      child: Text('Rangkuman'),
    ),
    const PopupMenuItem(
      value: 'e',
      child: Text('Evaluasi'),
    ),
    const PopupMenuItem(
      value: 'f',
      child: Text('Referensi'),
    ),
  ];

  @override
  void initState() {
    selectedSubBab = listBab[widget.bab]![0];
    _pdfViewerController = PdfViewerController();
    _searchResult = PdfTextSearchResult();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {});
    super.didChangeDependencies();
  }

  OverlayEntry? _overlayEntry;
  void _showContextMenu(
      BuildContext context, PdfTextSelectionChangedDetails details) {
    final OverlayState _overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 55,
        left: details.globalSelectedRegion!.bottomLeft.dx,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue.shade700)),
          child: const Text('Copy', style: TextStyle(fontSize: 16)),
          onPressed: () {
            Clipboard.setData(
                ClipboardData(text: details.selectedText.toString()));
            _pdfViewerController!.clearSelection();
          },
        ),
      ),
    );
    _overlayState.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    log(selectedSubBab);
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade700,
          title: Text(widget.bab),
          actions: [
            IconButton(
              splashRadius: 20.h,
              icon: Icon(
                !isSearch ? Icons.search : Icons.clear,
                color: Colors.white,
              ),
              onPressed: () async {
                setState(() {
                  isSearch = !isSearch;
                });
                // Gunakan async karena searchText adalah operasi asinkron
                // final result =
                //     await _pdfViewerController!.searchText('penting');
                // setState(() {
                //   _searchResult =
                //       result; // Tetapkan hasil pencarian ke _searchResult
                // });
              },
            ),
            Visibility(
              visible: _searchResult.hasResult,
              child: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _searchResult.clear();
                  });
                },
              ),
            ),
            Visibility(
              visible: _searchResult.hasResult,
              child: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                ),
                onPressed: () {
                  _searchResult.previousInstance();
                },
              ),
            ),
            Visibility(
              visible: _searchResult.hasResult,
              child: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                onPressed: () {
                  _searchResult.nextInstance();
                },
              ),
            ),
            PopupMenuButton(
              icon: const Icon(Icons.bookmark),
              itemBuilder: (context) {
                return subItem;
              },
              onSelected: (value) {
                log(value);
                switch (value) {
                  case 'a':
                    setState(() {
                      selectedSubBab = listBab[widget.bab]![0].toString();
                    });
                    break;
                  case 'b':
                    setState(() {
                      selectedSubBab = listBab[widget.bab]![1].toString();
                    });
                    break;
                  case 'c':
                    setState(() {
                      selectedSubBab = listBab[widget.bab]![2].toString();
                    });
                    break;
                  case 'd':
                    setState(() {
                      selectedSubBab = listBab[widget.bab]![3].toString();
                    });
                    break;
                  case 'e':
                    setState(() {
                      selectedSubBab = listBab[widget.bab]![4].toString();
                    });
                    break;
                  case 'f':
                    setState(() {
                      selectedSubBab = listBab[widget.bab]![5].toString();
                    });
                    break;
                  default:
                }
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            SizedBox(
              height: screenHeight,
              child: SfPdfViewer.asset(
                selectedSubBab,
                onTextSelectionChanged:
                    (PdfTextSelectionChangedDetails details) {
                  if (details.selectedText == null && _overlayEntry != null) {
                    _overlayEntry!.remove();
                    _overlayEntry = null;
                  } else if (details.selectedText != null &&
                      _overlayEntry == null) {
                    _showContextMenu(context, details);
                  }
                },
                key: _pdfViewerStateKey,
                controller: _pdfViewerController,
                currentSearchTextHighlightColor: Colors.red.withOpacity(0.6),
                otherSearchTextHighlightColor: Colors.yellow.withOpacity(0.2),
              ),
            ),
            Visibility(
              visible: isSearch,
              child: Padding(
                padding: EdgeInsets.all(8.h),
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    onChanged: (value) {
                      final result = _pdfViewerController!.searchText(value);
                      setState(() {
                        _searchResult = result;
                      });
                    },
                    controller: textEditingController,
                    style: TextStyle(color: Colors.black, fontSize: 18.sp),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white, // Warna latar belakang
                      hintText: 'Masukkan teks',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(16.0), // Border radius
                        borderSide: const BorderSide(
                            color: Colors.grey), // Warna border aktif
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.blue.shade700,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _pdfViewerController!.previousPage();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _pdfViewerController!.nextPage();
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _pdfViewerStateKey.currentState!.openBookmarkView();
                        },
                        icon: const Icon(
                          Icons.book,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PraktikumScreen(bab: widget.bab))),
                    child: Row(
                      children: [
                        Text(
                          'Praktikum',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 24.h,
                        ),
                        SizedBox(width: 8.w),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
