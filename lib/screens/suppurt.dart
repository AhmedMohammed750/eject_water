import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:water_edject/local/localcontrol.dart';
import 'package:water_edject/thems.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  String email='kosayalmansour@gmail.com';
  final Uri _url = Uri.parse('https://sites.google.com/view/watereject/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9-%D8%A7%D9%84%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A%D8%A9?authuser=1');
  final Uri _url1 = Uri.parse('https://www.buymeacoffee.com/Ahmedkurdish');
   final Uri _url2 = Uri.parse('mailto:kosayalmansour@gmail.com');

    

  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
    void _launchUrl1() async {
    if (!await launchUrl(_url1)) throw 'Could not launch $_url';
  }
      void _launchUrl2() async {
    if (!await launchUrl(_url2)) throw 'Could not launch $_url';
  }


  bool lan = false;
  @override
  Widget build(BuildContext context) {
    mycontroll controllan = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          '8'.tr,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        )),
        backgroundColor: Colors.blue[300],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Text(
                '7'.tr,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 30.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white12,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              fixedSize: Size(50.w, 10.h)),
                          onPressed: () {
                            _launchUrl();
                          },
                          child: Text(
                            '9'.tr,
                            style: TextStyle(
                                color: Colors.blue[300], fontSize: 15.sp),
                          )),
                    ),
                    SizedBox(height: 2.h,),
                    Expanded(
                      child: ElevatedButton( 
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              fixedSize: Size(50.w, 10.h)),
                          onPressed: () {
                            _launchUrl1();
                          },
                          child: Text(
                            '27'.tr,
                            style: TextStyle(
                                color: Colors.blue[300], fontSize: 15.sp),
                          )),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.light,
                          color: Colors.blue,
                        ),
                        label: Text(
                          '10'.tr,
                          style: TextStyle(
                              color: Colors.blue[300], fontSize: 15.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, fixedSize: Size(50.w, 10.h)),
                        onPressed: () {
                          ThemeService().changeTheme();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Expanded(
                        child: ElevatedButton.icon(icon:Icon(Icons.support_agent_rounded,color: Colors.blue,) ,
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                fixedSize: Size(50.w, 10.h)),
                            onPressed: () {_launchUrl2();},
                            label: Text(
                              '11'.tr,
                              style: TextStyle(
                                  color: Colors.blue[300], fontSize: 15.sp),
                            ))),
                    SizedBox(
                      height: 2.h,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.language,
                          color: Colors.blue,
                        ),
                        label: Text(
                          '12'.tr,
                          style: TextStyle(
                              color: Colors.blue[300], fontSize: 15.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, fixedSize: Size(50.w, 10.h)),
                        onPressed: () {
                          (lan == true)
                              ? controllan.changelan('en')
                              : controllan.changelan('ar');
                          lan = !lan;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '6'.tr,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height:20.h ,
                width: 90.w,
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '13'.tr,
                      style: TextStyle(
                          color: Colors.blue[300],
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      '14'.tr,
                      style: TextStyle(
                          color: Colors.blue[300],
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 4.h,
                      width: 30.w,
                      child: SpinKitThreeInOut(
                        color: Colors.blue,
                        size: 7.h,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
