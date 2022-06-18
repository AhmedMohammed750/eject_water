import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:water_edject/screens/info.dart';
import 'package:water_edject/screens/soundpage.dart';
import 'package:sizer/sizer.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key) {
    _inter();
  }

  late InterstitialAd _InterstitialAd;
  bool isload = false;
  void _inter() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-4374451461113411/4853791067',
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
    _InterstitialAd.fullScreenContentCallback=FullScreenContentCallback(
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
        backgroundColor: Colors.blue[900],
        // ignore: prefer_const_constructors
        title: Center(
            // ignore: prefer_const_constructors
            child: Text(
          '1'.tr,
          // ignore: prefer_const_constructors
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          textAlign: TextAlign.center,
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      try {
                        if (isload) {
                          _InterstitialAd.show();
                        }
                      } catch (e) {
                        print('e');
                      }

                      Navigator.push(context,
                          MaterialPageRoute(builder: (value) => Info()));
                    },
                    icon: Icon(Icons.info),
                    color: Colors.blue[900],
                    iconSize: 6.h,
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '2'.tr,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              // ignore: prefer_const_constructors
              SizedBox(
                height: 5.h,
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
                          if (isload) {
                            try {
                              _InterstitialAd.show();
                            } catch (e) {
                              print(e);
                            }
                          }
                          // ignore: prefer_const_constructors
                          Navigator.push(context,
                              MaterialPageRoute(builder: (e) => Sound()));
                        },
                        onHover: (value) {
                          Colors.blue;
                        },
                        child: Column(
                          children: [
                            Ink.image(
                              image: AssetImage('images/image1.gif'),
                              height: 25.h,
                              width: 25.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              '3'.tr,
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
                height: 23.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    height: 3.h,
                    width: 25.w,
                    child: SpinKitThreeInOut(
                      color: Colors.blue,
                      size: 7.h,
                    )),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
