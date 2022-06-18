

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';
import 'package:water_edject/screens/blowers.dart';

class dpmeter extends StatelessWidget {
  dpmeter({Key? key}) : super(key: key) {
    _inter();
  }
  late InterstitialAd _InterstitialAd;
  bool isload = false;
  void _inter() {
    InterstitialAd.load(
        adUnitId:'ca-app-pub-4374451461113411/1622242627',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: onload,
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  void onload(InterstitialAd ad) {
    _InterstitialAd = ad;
    isload = true;
    _InterstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        _InterstitialAd.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _InterstitialAd.dispose();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
            '19'.tr,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          )),
          backgroundColor: Colors.blue[500]),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('20'.tr,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900])),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                          onTap: () {
                            try {
                              if (isload) {
                                _InterstitialAd.show();
                              }
                            } catch (e) {
                              print('e');
                            }
                            // ignore: prefer_const_constructors
                            Navigator.push(context,
                                MaterialPageRoute(builder: (e) => Blowers()));
                          },
                          onHover: (value) {
                            Colors.blue;
                          },
                          child: Column(
                            children: [
                              Ink.image(
                                image: AssetImage('images/mobile blower1.png'),
                                height: 25.h,
                                width: 25.h,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                '19'.tr,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13.h,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: 20.h,
                      width: 30.w,
                      child: SpinKitThreeInOut(
                        color: Colors.blue,
                        size: 7.h,
                      )),
                ])
              ],
            )),
      ),
    );
  }
}
