// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({Key? key}) : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late WebViewXController webviewController;
  final String htmlUrl = 'http://127.0.0.1:5500/lib/form_html.html';
  @override
  void initState() {
    super.initState();
  }

  // ignore: unused_field
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      //  EdgeInsets.fromLTRB(35.0, 8.0, 35.0, bottomNotchPadding),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 40.0),
          WebViewX(
            width: width,
            height: height / 3,
            onWebViewCreated: (controller) {
              webviewController = controller;

              webviewController.loadContent(
                htmlUrl,
                SourceType.url,
                headers: {
                  "Access-Control-Allow-Origin": "*",
                  "Access-Control-Allow-Methods":
                      "GET, POST, PUT, DELETE, OPTIONS",
                  "Access-Control-Allow-Headers": " Content-Type",
                },
              );
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: () async {
                  var result = await webviewController.callJsMethod(
                    'onSubmit',
                    [],
                  );
                  log(result);
                  // AppRoute.push(context, MainScreen());
                },
                child: Text("Continue"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
