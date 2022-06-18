// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sizer/sizer.dart';


class Sound extends StatefulWidget {
  const Sound({Key? key}) : super(key: key);

  @override
  State<Sound> createState() => _SoundState();
}

class _SoundState extends State<Sound> {
  bool isplay = false;
  IconData playbtn = Icons.play_arrow;

  late AudioPlayer player;
  late AudioCache _cache1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    player = AudioPlayer();
    _cache1 = AudioCache(fixedPlayer: player);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_literals_to_create_immutables
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '21'.tr,
                    style: TextStyle(fontSize: 15.sp, color: Colors.blue[900],),
                  ),
                  Text(
                    '22'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: Colors.blue[900]),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '23'.tr,
                    style: TextStyle(fontSize: 15.sp, color: Colors.blue[900]),
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.keyboard_voice,
                    color: Colors.blue[900],
                    size:20.h,
                  ),
                  SizedBox(width: 2.h,),
                  Icon(
                    Icons.phone_android,
                    color: Colors.blue[900],
                    size: 20.h,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '24'.tr,
                style: TextStyle(color: Colors.blue[900], fontSize: 15.sp),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text('25'.tr,
                  style: TextStyle(color: Colors.blue[900], fontSize: 15.sp)),
              Container(
                height: 10.h,
                width: 25.w,
                child: (isplay == true)
                    ? SpinKitSpinningLines(
                        color: Colors.blue,
                        size: 7.h,
                      )
                    : null,
              ),
              SizedBox(
                height: 10.h,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (!isplay) {
                    setState(() {
                      playbtn = Icons.pause_circle_outline_sharp;
                      isplay = true;
                    });
                    playmusic();
                  } else {
                    setState(() {
                      playbtn = Icons.play_arrow;
                      isplay = false;
                      Navigator.pop(context);
                    });
                    stopmusic();
                  }
                },
                icon: Icon(playbtn),
                label: (isplay == true) ? Text('18'.tr) : Text('26'.tr),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    elevation: 20,
                    fixedSize: Size(50.w, 7.h)),
              )
            ],
          ),
        ),
      ),
    );
  }

  playmusic() {
    _cache1.play('sound.mp3');
  }

  stopmusic() {
    player.pause();
  }
}
