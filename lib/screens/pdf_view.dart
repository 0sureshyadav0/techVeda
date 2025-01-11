import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:tech_veda/consts/consts.dart';

class PDFViewerScreen extends StatelessWidget {
  final String title;
  final String path;

  const PDFViewerScreen({super.key, required this.title, required this.path});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: darkPurple,
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SfPdfViewer.asset(
        path, // Local asset
        // For URL: SfPdfViewer.network('https://example.com/sample.pdf')
      ),
    );
  }
}
