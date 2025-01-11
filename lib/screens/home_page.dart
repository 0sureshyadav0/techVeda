import 'package:flutter/material.dart';
import 'package:tech_veda/conponents/app_development.dart';
import 'package:tech_veda/conponents/database.dart';

import 'package:tech_veda/conponents/hacking.dart';
import 'package:tech_veda/conponents/python.dart';
import 'package:tech_veda/consts/consts.dart';
import 'package:tech_veda/widgets/text.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkPurple,
        title: myText(widget.title, color: Colors.white, size: 22.0),
      ),
      // backgroundColor: darkPurple,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Column(
            children: [
              AppDevelopment(),
              Python(),
              Hacking(),
              Database(),
            ],
          ),
        ),
      ),
    );
  }
}
