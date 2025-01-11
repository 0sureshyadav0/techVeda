import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_veda/screens/pdf_view.dart';
import 'package:tech_veda/widgets/text.dart';

class AppDevelopment extends StatefulWidget {
  const AppDevelopment({super.key});

  @override
  State<AppDevelopment> createState() => _AppDevelopmentState();
}

class _AppDevelopmentState extends State<AppDevelopment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: myText(
            "App Development",
            size: 24.0,
          ),
        ),
        SizedBox(height: 2),
        SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courseName.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 5.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => PDFViewerScreen(
                            title: "${courseName[index]['courseName']}",
                            path: "${courseName[index]['path']}",
                          ));
                    },
                    child: Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width / 1.4,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              opacity: 0.6,
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "${courseName[index]['image']}",
                              )),
                          borderRadius: BorderRadius.circular(
                            10,
                          )),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ListTile(
                          tileColor: Colors.white,
                          title: myText(
                            "${courseName[index]['courseName']}",
                            size: 28.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  List<Map<String, String>> courseName = [
    {
      'courseName': 'Dart',
      'image': './assets/images/dart.png',
      'path': './assets/pdfs/Introduction to Dart.pdf'
    },
    {
      'courseName': 'Flutter',
      'image': './assets/images/flutter.png',
      'path': './assets/pdfs/Introduction to Flutter.pdf'
    },
    {
      'courseName': 'Flutter Basics',
      'image': './assets/images/flutter1.png',
      'path': './assets/pdfs/Flutter Basics.pdf'
    },
    {
      'courseName': 'Android',
      'image': './assets/images/android.jpeg',
      'path': './assets/pdfs/JAVA.pdf'
    },
    // {
    //   'courseName': 'Kotlin',
    //   'image':
    //       'https://www.jrebel.com/sites/default/files/image/2021-01/what%20is%20kotlin%20banner%20image.png',
    //   'path': './assets/pdfs/Introduction to Flutter.pdf'
    // },
  ];
}
