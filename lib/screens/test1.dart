import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

class test1 extends StatefulWidget {
  const test1({Key? key}) : super(key: key);

  @override
  State<test1> createState() => _test1State();
}

class _test1State extends State<test1> {
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
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          '15'.tr,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '16'.tr,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 30,),
            Container(
              
              height: 150,
              width: 150,
              child:(isplay==false)? KdGaugeView(minSpeed: 0,maxSpeed: 100,speed: 100,animate: true,duration: Duration(minutes:3,seconds: 50),speedTextStyle:TextStyle(color: Colors.blue,fontSize: 17),unitOfMeasurement: "",alertSpeedArray: [0,50,],alertColorArray: [Colors.blue,Colors.red]):null, 
            ),
            SizedBox(
              height: 150,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  if (isplay == true) {
                    playbtn = Icons.stop;
                    playmusic();
                    isplay = false;
                  } else {
                    stopmusic();
                    playbtn = Icons.done;
                    isplay = true;
                    Navigator.pop(context);
                  }
                });
              },
              icon: Icon(playbtn),
              label: (isplay == true) ? Text('17'.tr) : Text('18'.tr),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue[700],
                  elevation: 30,
                  fixedSize: Size(200, 50)),
            )
          ],
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
