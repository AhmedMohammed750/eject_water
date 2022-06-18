// ignore: file_names

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

// ignore: use_key_in_widget_constructors
class Info extends StatefulWidget {
  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:  Text('5'.tr),
      ),
      body: Container(color: Colors.blue[900],
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(30)),
            child: Text(
              '4'.tr,
              style: TextStyle(fontSize: 24,color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
