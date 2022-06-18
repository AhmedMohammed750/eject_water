import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:water_edject/screens/test1.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  late AudioPlayer player;
  late AudioCache cache;
  bool isplay = true;
  IconData playbtn = Icons.done;
 final spinkit = SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player = AudioPlayer();
    cache = AudioCache(fixedPlayer: player);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          '15'.tr,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),
        )),
        backgroundColor: Colors.blue[700],
      ),
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
                  Text(
                    '16'.tr,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: 15.h,),
             

              ElevatedButton.icon(
                onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder:(value)=>test1()));
                    setState(() {
                       if(isplay==false){
                      
                    }
                      
                    });
                   
                },
                icon: Icon(playbtn),
                label: (isplay == true) ? Text('17'.tr) : Text('18'.tr),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[700],
                    elevation: 30,
                    fixedSize: Size(40.w, 9.h)),
              ),
                 SizedBox(height:33.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[ 
                  Container(
                      height: 10.h,
                      width: 30.w,
                      child: SpinKitThreeInOut(
                        color: Colors.blue,
                        size: 7.h,
                      )
                      ),]
                      )
            ],
          ),
        ),
      ),
    );
  }

  playmusic() {
    cache.play('sound1.mp3');
  }

  stopmusic() {
    player.stop();
  }

  
}
