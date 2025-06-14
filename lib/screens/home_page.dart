import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tech_veda/conponents/app_development.dart';
import 'package:tech_veda/conponents/basics.dart';
import 'package:tech_veda/conponents/database.dart';

import 'package:tech_veda/conponents/hacking.dart';
import 'package:tech_veda/conponents/python.dart';
import 'package:tech_veda/consts/consts.dart';
import 'package:tech_veda/features/version/provider/version_provider.dart';
import 'package:tech_veda/screens/developer.dart';
import 'package:tech_veda/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isUpdateAvailable = false;

  // Show update dialog
  void showUpdateDialog(
      String downloadUrl, String currentVersion, String latestVersion) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        // backgroundColor: Colors.grey[900],
        title: myText(
          "Update Available!",
          size: 25.0,
        ),
        content: SizedBox(
          height: MediaQuery.of(context).size.height / 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "A new version of the app is available. Please update.",
                style: TextStyle(fontSize: 15.0),
              ),
              myText(
                'Current Version: $currentVersion',
                size: 14.0,
                // color: const Color.fromARGB(255, 185, 185, 185),
              ),
              myText(
                'Latest Version: $latestVersion',
                size: 14.0,
                // color: const Color.fromARGB(255, 185, 185, 185),
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: myText("Later"),
          ),
          TextButton(
            onPressed: () {
              if (downloadUrl.isNotEmpty) {
                // Open the dynamic APK download URL
                launchUrl(Uri.parse(downloadUrl));
              } else {
                Get.snackbar('Error', "Url not found",
                    colorText: Colors.white, backgroundColor: Colors.red[900]);
              }
            },
            child: Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: myText(
                "Update Now",
                color: Colors.white,
              )),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final providerInstance =
        Provider.of<VersionProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        bool isUpdateAvailable =
            await Provider.of<VersionProvider>(context, listen: false)
                .checkForUpdate();
        String downloadUrl = providerInstance.downloadUrl;
        String currentVersion = providerInstance.currentVersion;
        String latestVersion = providerInstance.latestVersion;

        if (isUpdateAvailable) {
          showUpdateDialog(downloadUrl, currentVersion, latestVersion);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkPurple,
        title: myText(widget.title, color: Colors.white, size: 22.0),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const DeveloperContactInfo());
              },
              icon: Image(image: AssetImage('./assets/images/developer.png'))),
        ],
      ),
      // backgroundColor: darkPurple,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Column(
            children: [
              Basics(),
              AppDevelopment(),
              Python(),
              Hacking(),
              Database(),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
