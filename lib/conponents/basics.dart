import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_veda/screens/pdf_view.dart';
import 'package:tech_veda/widgets/text.dart';

class Basics extends StatefulWidget {
  const Basics({super.key});

  @override
  State<Basics> createState() => _BasicsState();
}

class _BasicsState extends State<Basics> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: myText(
            "Basics",
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
                            size: 18.0,
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
      'courseName': 'C Programming',
      'image': './assets/images/c-programming.jpg',
      'path': './assets/pdfs/C_programming.pdf'
    },
  ];
}